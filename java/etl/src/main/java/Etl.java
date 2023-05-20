import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.Map.Entry;
import static java.util.Map.entry;

class Etl {
    Map<String, Integer> transform(Map<Integer, List<String>> old) {
        return old.entrySet()
                .stream()
                .flatMap(entry -> entry.getValue()
                        .stream()
                        .map(s -> entry(s.toLowerCase(), entry.getKey())))
                .collect(Collectors.toMap(
                        Entry::getKey,
                        Entry::getValue
                ));
    }
}
