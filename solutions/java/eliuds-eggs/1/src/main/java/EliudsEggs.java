import java.util.Arrays;

public class EliudsEggs {
    public int eggCount(int number) {
        return (int) Arrays.stream(Integer.toBinaryString(number).split(""))
            .filter("1"::equals)
            .count();
    }
}
