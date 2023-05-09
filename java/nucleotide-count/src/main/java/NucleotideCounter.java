import java.util.HashMap;
import java.util.Map;

public class NucleotideCounter {

    private String nucleotide;

    public NucleotideCounter(String nucleotide) {
        if (nucleotide.matches("[ATGC]*")) {
            this.nucleotide = nucleotide;
        } else {
            throw new IllegalArgumentException();
        }
    }

    public Map<Character, Integer> nucleotideCounts() {
        var map = new HashMap<Character, Integer>() {{
            put('A', 0);
            put('C', 0);
            put('G', 0);
            put('T', 0);
        }};
        nucleotide.chars()
                .mapToObj(code -> (char) code)
                .forEach(x -> map.merge(x, 1, Integer::sum));
        return map;
    }
}