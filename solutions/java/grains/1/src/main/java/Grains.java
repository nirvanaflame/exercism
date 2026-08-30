import java.math.BigInteger;
import java.util.HashMap;

class Grains {

    HashMap<Integer, BigInteger> cache = new HashMap<>();

    // 1 2 4 8 16
    // f(n-1) * 2

    // n = 50
    // f(n-1) = f(49) * 2

    BigInteger grainsOnSquare(final int square) {
        if (square < 1 || square > 64) {
            throw new IllegalArgumentException("square must be between 1 and 64");
        }
        return count(square);
    }

    BigInteger count(int n) {
        if (n <= 1) {
            return BigInteger.ONE;
        } else if (cache.containsKey(n)) {
            return cache.get(n);
        }

        BigInteger bi = count(n - 1).multiply(BigInteger.TWO);
        cache.put(n, bi);
        return cache.get(n);
    }

    BigInteger grainsOnBoard() {
        return new BigInteger("18446744073709551615");
    }
}
