import java.util.stream.IntStream;

public class Hamming {
    char[] lefts, rights;
    
    public Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() == rightStrand.length()) {
            lefts = leftStrand.toCharArray();
            rights = rightStrand.toCharArray();
        } else {
            if (leftStrand.isEmpty()) throw new IllegalArgumentException("left strand must not be empty.");
            if (rightStrand.isEmpty()) throw new IllegalArgumentException("right strand must not be empty.");
            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");
        }

    }

    public int getHammingDistance() {
        return (int) IntStream.range(0, lefts.length)
                .filter(i -> lefts[i] != rights[i])
                .count();
    }
}
