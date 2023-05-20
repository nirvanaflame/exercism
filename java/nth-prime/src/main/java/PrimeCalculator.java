import java.util.ArrayList;

import static java.util.stream.IntStream.iterate;

class PrimeCalculator {

    int nth(int nth) {
        if (nth < 1) throw new IllegalArgumentException();
        if (nth == 1) return 2;

        var primes = new ArrayList<Integer>() {{ add(2); }};
        return iterate(3, i -> primes.size() < nth, i -> i + 1)
                .filter(it -> primes.stream().allMatch(p -> it % p != 0))
                .peek(primes::add)
                .toArray()[nth - 2];
    }
}
