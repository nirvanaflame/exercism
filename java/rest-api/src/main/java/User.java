import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * POJO representing a User in the database.
 */
public class User {
    private final String name;
    private final List<Iou> owes;
    private final List<Iou> owedBy;

    private User(String name, List<Iou> owes, List<Iou> owedBy) {
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

        public User build() {
            return new User(name, owes, owedBy);
        }
    }
}
