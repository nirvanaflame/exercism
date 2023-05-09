import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;
import java.util.stream.Stream;

public class NucleotideCounter {

    private final Map<Character, Integer> counts = new HashMap<>() {{
        Stream.of('A', 'C', 'G', 'T').forEach(ch -> put(ch, 0));
    }};

    public NucleotideCounter(String strand) {
        Consumer<Character> isValid = ch -> {
            if (!counts.containsKey(ch)) throw new IllegalArgumentException();
        };

        strand.chars()
                .mapToObj(code -> (char) code)
                .peek(isValid)
                .forEach(ch -> counts.merge(ch, 1, Integer::sum));
    }

    public Map<Character, Integer> nucleotideCounts() {
        return counts;
    }
}