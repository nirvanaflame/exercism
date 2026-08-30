import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

class WordCount {
    public Map<String, Integer> phrase(String text) {
        return Arrays.stream(text.toLowerCase().replaceAll("[^a-z0-9']+", " ")
                        .split("\\s+"))
                .filter(w -> !w.isEmpty())
                .map(w -> w.endsWith("'")
                        ? w.substring(1, w.length() - 1)
                        : w)
                .collect(Collectors.groupingBy(
                        Function.identity(),
                        LinkedHashMap::new,
                        Collectors.summingInt(val -> 1)
                ));
    }
}
