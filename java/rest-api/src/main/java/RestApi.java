import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

class RestApi {

    List<User> repository;

    public RestApi(User... users) {
        this.repository = new ArrayList<>(List.of(users));
    }

    private Optional<User> findUser(String name) {
        return repository.stream().filter(u -> u.name().equals(name)).findFirst();
    }

    private void saveAll(User... users) {
        for (User user : users) {
            saveUser(user);
        }
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
            User user = findUser(name).orElse(null);
            return marshal(user);
        }
        return "";
    }

    public String post(String url, JSONObject payload) {
        if (url.equals("/add")) {
            User user = unmarshallUser(payload);
            repository.add(user);
            return marshalUser(user).toString();
        } else if (url.equals("/iou")) {
            String lenderName = payload.getString("lender");
            String borrowerName = payload.getString("borrower");
            double amount = payload.getDouble("amount");
            User lender = new User.Builder().setName(lenderName).owedBy(borrowerName, amount).build();
            User borrower = new User.Builder().setName(borrowerName).owes(lenderName, amount).build();
            saveAll(lender, borrower);
            lender = findUser(lender.name()).get();
            borrower = findUser(borrower.name()).get();
            return marshal(lender, borrower);
        }
        return "";
    }

    private static String marshal(User... users) {
        JSONArray array = new JSONArray();
        for (User user : users) {
            array.put(marshalUser(user));
        }

        return new JSONObject().put("users", array).toString();
    }

    private static JSONObject marshalUser(User user) {
        JSONObject object = new JSONObject().put("name", user.name()).put("balance", calcBalance(user));
        putJsonArray(object, user);
        return object;
    }

    private static List<User> unmarshallUsers(JSONObject payload) {
        JSONArray array = payload.getJSONArray("users");
        ArrayList<User> users = new ArrayList<>();
        for (Object object : array) {
            JSONObject o = (JSONObject) object;
            User user = unmarshallUser(o);
            users.add(user);
        }
        return users;
    }

    private static User unmarshallUser(JSONObject payload) {
        String userName = payload.getString("user");
        return new User.Builder().setName(userName).build();
    }

    private static void putJsonArray(JSONObject object, User user) {
        putJsonArray("owes", user.owes(), object);
        putJsonArray("owedBy", user.owedBy(), object);
    }

    private static void putJsonArray(String property, List<Iou> owned, JSONObject object) {
        if (owned.size() == 0) {
            object.put(property, new JSONObject());
        } else  {
            object.put(property, putOwns(owned.toArray(Iou[]::new)));
        }
    }

    private static JSONArray putOwns(Iou... owned) {
        JSONArray array = new JSONArray();
        for (Iou iou : owned) {
            array.put(putOwn(iou));
        }
        return array;
    }

    private static JSONObject putOwn(Iou o) {
        return new JSONObject().put(o.name, o.amount);
    }

    private static double calcBalance(User user) {
        double lender = getTotalBalance(user.owes());
        double borrower = getTotalBalance(user.owedBy());

        return borrower - lender;
    }

    private static Double getTotalBalance(List<Iou> owes) {
        return owes.stream().map(Iou::getAmount).reduce(Double::sum).orElse(0.0);
    }
}