import java.util.stream.IntStream;

public class NaturalNumber {

    int num;

    public NaturalNumber(int num) {
        if (num < 1) throw new IllegalArgumentException("You must supply a natural number (positive integer)");
        this.num = num;
    }

    public Classification getClassification() {
        if (num == 1) return Classification.DEFICIENT;
        int divisorSum = IntStream.rangeClosed(2, num / 2).filter(x -> num % x == 0).sum() + 1;

        if (divisorSum == num) return Classification.PERFECT;
        if (divisorSum < num) return Classification.DEFICIENT;
        else return Classification.ABUNDANT;
    }
}
