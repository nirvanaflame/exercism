import org.json.JSONArray;
import org.json.JSONObject;

import java.util.*;

class RestApi {

    private final UserRepository repository;

    public RestApi(User... users) {
        this.repository = new UserRepository(users);
    }

    public String get(String url) {
        if (url.equals("/users")) {
            return marshal();
        }
        return "";
    }

    public String get(String url, JSONObject payload) {
        if (url.equals("/users")) {
            JSONArray array = payload.getJSONArray("users");
            String name = array.getString(0);
            User user = repository.findUser(name).orElse(null);
            return marshal(user);
        }
        return "";
    }

    public String post(String url, JSONObject payload) {
        if (url.equals("/add")) {
            User user = unmarshallUser(payload);
            repository.saveUser(user);
            return marshalUser(user).toString();
        } else if (url.equals("/iou")) {
            return charge(payload);
        }
        return "";
    }

    private static User unmarshallUser(JSONObject payload) {
        String userName = payload.getString("user");
        return new User.Builder().setName(userName).build();
    }

    private static String marshal(User... users) {
        JSONArray array = new JSONArray();
        List<User> userList = Arrays.stream(users).sorted(Comparator.comparing(User::name)).toList();
        userList.forEach(x -> {
            array.put(marshalUser(x));
        });

        return new JSONObject().put("users", array).toString();
    }

    private static JSONObject marshalUser(User user) {
        JSONObject object = new JSONObject().put("name", user.name()).put("balance", calcBalance(user));
        putJsonArray(object, user);
        return object;
    }

    private static void putJsonArray(JSONObject object, User user) {
        putJsonArray("owes", user.owes(), object);
        putJsonArray("owedBy", user.owedBy(), object);
    }

    private static void putJsonArray(String property, List<Iou> owned, JSONObject object) {
        if (owned.size() == 0) {
            object.put(property, new JSONObject());
        } else  {
            object.put(property, putOwns(owned));
        }
    }

    private static HashMap<String, Double> putOwns(List<Iou> owned) {
        HashMap<String, Double> own = new HashMap<>();
        owned.forEach(x -> own.put(x.name, x.amount));
        return own;
    }

    private static double calcBalance(User user) {
        double lender = getTotalBalance(user.owes());
        double borrower = getTotalBalance(user.owedBy());

        return borrower - lender;
    }

    private static Double getTotalBalance(List<Iou> owes) {
        return owes.stream().map(Iou::getAmount).reduce(Double::sum).orElse(0.0);
    }

    private String charge(JSONObject payload) {
        String lenderName = payload.getString("lender");
        String borrowerName = payload.getString("borrower");
        double amount = payload.getDouble("amount");


        User lender = repository.findUser(lenderName).get();
        Optional<Iou> owe = lender.findOwe(borrowerName);
        owe.ifPresentOrElse(x -> {
            var money = x.amount - amount;
            if (money == 0) {
                lender.replaceOwe(x, null);
            } else if (money > 0) {
                Iou newIou = new Iou(x.name, money);
                lender.replaceOwe(x, newIou);
            } else  {
                lender.replaceOwe(x, null);
                Iou iou = new Iou(x.name, -money);
                lender.addOwed(iou);
            }
        }, () -> {
            Iou iou1 = new Iou(borrowerName, amount);
            lender.addOwed(iou1);
        });

        User borrower = repository.findUser(borrowerName).get();
        Optional<Iou> owed = borrower.findOwed(lenderName);
        owed.ifPresentOrElse(x -> {
            var money = x.amount - amount;
            if (money == 0) {
                borrower.replaceOwed(x, null);
            } else if (money > 0) {
                Iou iou = new Iou(x.name, money);
                borrower.replaceOwed(x, iou);
            } else {
                borrower.replaceOwed(x, null);
                Iou iou = new Iou(x.name, -money);
                borrower.addOwe(iou);
            }
        }, () -> borrower.addOwe(new Iou(lenderName, amount)));

        return marshal(lender, borrower);
    }

    static class UserRepository {

        private final List<User> repository;

        UserRepository(User... users) {
            this.repository = new ArrayList<>(List.of(users));
        }

        private Optional<User> findUser(String name) {
            return repository.stream().filter(u -> u.name().equals(name)).findFirst();
        }

        private void saveUser(User toSave) {
            Optional<User> optionalUser = findUser(toSave.name());
            optionalUser.ifPresentOrElse(
                    saved -> mergeUser(saved, toSave),
                    () -> repository.add(toSave)
            );
        }

        private void mergeUser(User saved, User toSave) {
            List<Iou> owes = mergeList(saved.owes(), toSave.owes());
            List<Iou> owedBy = mergeList(saved.owedBy(), toSave.owedBy());

            User.Builder builder = User.builder().setName(toSave.name());
            owes.forEach(x -> builder.owes(x.name, x.amount));
            owedBy.forEach(x -> builder.owedBy(x.name, x.amount));
            User user = builder.build();

            repository.add(user);
            repository.remove(saved);
        }

        private List<Iou> mergeList(List<Iou> list1, List<Iou> list2) {
            ArrayList<Iou> result = new ArrayList<>();

            result.addAll(list1);
            result.addAll(list2);

            return result.stream()
                    .sorted(Comparator.comparing(Iou::getName))
                    .toList();
        }
    }
}