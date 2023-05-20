import java.util.Arrays;
import java.util.stream.IntStream;

class SumOfMultiples {
    int sum;

    SumOfMultiples(int number, int[] set) {
        this.sum = Arrays.stream(set)
                .filter(num -> num > 0)
                .flatMap(num -> IntStream.iterate(num, x -> x < number, x -> x + num))
                .distinct()
                .sum();
    }

    int getSum() {
        return sum;
    }
}
