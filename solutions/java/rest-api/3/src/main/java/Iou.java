import java.util.Comparator;

public class Iou implements Comparator<String> {
    public final String name;
    public final double amount;

    public Iou(String name, double amount) {
        this.name = name;
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public double getAmount() {
        return amount;
    }

    @Override
    public String toString() {
        return "Iou{" +
                "name='" + name + '\'' +
                ", amount=" + amount +
                '}';
    }

    @Override
    public int compare(String o1, String o2) {
        return String.CASE_INSENSITIVE_ORDER.compare(o1, o2);
    }
}
