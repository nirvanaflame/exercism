import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

class WordCount {
    public Map<String, Integer> phrase(String text) {
        return Arrays.stream(text.toLowerCase().replaceAll("[^a-z0-9']+", " ")
                        .split("\\s+"))
                .filter(s -> !s.isEmpty())
                .collect(Collectors.groupingBy(
                        Function.identity(),
                        LinkedHashMap::new,
                        Collectors.summingInt(val -> 1)
                ));
    }
}
