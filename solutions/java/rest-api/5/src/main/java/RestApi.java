import org.json.JSONArray;
import org.json.JSONObject;

import java.util.*;

public class RestApi {

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
            MyUser user = repository.findUser(name).orElse(null);
            return marshal(user);
        }
        return "";
    }

    public String post(String url, JSONObject payload) {
        if (url.equals("/add")) {
            MyUser user = unmarshallUser(payload);
            repository.saveUser(user);
            return marshalUser(user).toString();
        } else if (url.equals("/iou")) {
            return charge(payload);
        }
        return "";
    }

    private static MyUser unmarshallUser(JSONObject payload) {
        String userName = payload.getString("user");
        return new MyUser.Builder().setName(userName).build();
    }

    private static String marshal(MyUser... users) {
        JSONArray array = new JSONArray();
        List<MyUser> userList = Arrays.stream(users).sorted(Comparator.comparing(MyUser::name)).toList();
        userList.forEach(x -> {
            array.put(marshalUser(x));
        });

        return new JSONObject().put("users", array).toString();
    }

    private static JSONObject marshalUser(MyUser user) {
        JSONObject object = new JSONObject().put("name", user.name()).put("balance", calcBalance(user));
        putJsonArray(object, user);
        return object;
    }

    private static void putJsonArray(JSONObject object, MyUser user) {
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

    private static double calcBalance(MyUser user) {
        double lender = getTotalBalance(user.owes());
        double borrower = getTotalBalance(user.owedBy());

        return borrower - lender;
    }

    private static Double getTotalBalance(List<Iou> owes) {
        return owes.stream().map(iou -> iou.amount).reduce(Double::sum).orElse(0.0);
    }

    private String charge(JSONObject payload) {
        String lenderName = payload.getString("lender");
        String borrowerName = payload.getString("borrower");
        double amount = payload.getDouble("amount");


        MyUser lender = repository.findUser(lenderName).get();
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

        MyUser borrower = repository.findUser(borrowerName).get();
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

        private final List<MyUser> repository;

        UserRepository(User... users) {
            ArrayList<MyUser> myUsers = new ArrayList<>();
            for (User user : users) {
                MyUser myUser = new MyUser(user.name(), user.owes(), user.owedBy());
                myUsers.add(myUser);
            }
            this.repository = myUsers;
        }

        private Optional<MyUser> findUser(String name) {
            return repository.stream().filter(u -> u.name().equals(name)).findFirst();
        }

        private void saveUser(MyUser toSave) {
            Optional<MyUser> optionalUser = findUser(toSave.name());
            optionalUser.ifPresentOrElse(
                    saved -> mergeUser(saved, toSave),
                    () -> repository.add(toSave)
            );
        }

        private void mergeUser(MyUser saved, MyUser toSave) {
            List<Iou> owes = mergeList(saved.owes(), toSave.owes());
            List<Iou> owedBy = mergeList(saved.owedBy(), toSave.owedBy());

            MyUser.Builder builder = MyUser.builder().setName(toSave.name());
            owes.forEach(x -> builder.owes(x.name, x.amount));
            owedBy.forEach(x -> builder.owedBy(x.name, x.amount));
            MyUser user = builder.build();

            repository.add(user);
            repository.remove(saved);
        }

        private List<Iou> mergeList(List<Iou> list1, List<Iou> list2) {
            ArrayList<Iou> result = new ArrayList<>();

            result.addAll(list1);
            result.addAll(list2);

            return result;
        }
    }

    static class MyUser {
        private final String name;
        private final List<Iou> owes;
        private final List<Iou> owedBy;

        private MyUser(String name, List<Iou> owes, List<Iou> owedBy) {
            this.name = name;
            this.owes = new ArrayList<>(owes);
            this.owedBy = new ArrayList<>(owedBy);
        }

        public String name() {
            return name;
        }

        /**
         * IOUs this user owes to other users.
         */
        public List<Iou> owes() {
            return owes;
        }

        /**
         * IOUs other users owe to this user.
         */
        public List<Iou> owedBy() {
            return owedBy;
        }

        public Optional<Iou> findOwe(String name) {
            return owes.stream().filter(x -> x.name.equals(name)).findFirst();
        }

        public void replaceOwe(Iou oldIou, Iou newIou) {
            owes.remove(oldIou);
            if (newIou != null) owes.add(newIou);
        }

        public void addOwe(Iou iou) {
            owes.add(iou);
        }

        public void addOwed(Iou iou) {
            owedBy.add(iou);
        }

        public Optional<Iou> findOwed(String name) {
            return owedBy.stream().filter(x -> x.name.equals(name)).findFirst();
        }

        public void replaceOwed(Iou name, Iou newIou) {
            owedBy.remove(name);
            if (newIou != null) owedBy.add(newIou);
        }

        @Override
        public String toString() {
            return "User{" +
                    "name='" + name + '\'' +
                    ", owes=" + owes +
                    ", owedBy=" + owedBy +
                    '}';
        }

        public static Builder builder() {
            return new Builder();
        }

        public static class Builder {
            private String name;
            private final List<Iou> owes = new ArrayList<>();
            private final List<Iou> owedBy = new ArrayList<>();

            public Builder setName(String name) {
                this.name = name;
                return this;
            }

            public Builder owes(String name, double amount) {
                owes.add(new Iou(name, amount));
                return this;
            }

            public Builder owedBy(String name, double amount) {
                owedBy.add(new Iou(name, amount));
                return this;
            }

            public MyUser build() {
                return new MyUser(name, owes, owedBy);
            }
        }
    }
}