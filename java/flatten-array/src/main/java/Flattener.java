import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

public class Flattener {

    public List<Object> flatten(List<Object> list) {
        return list.stream()
                .flatMap(o -> o instanceof List
                        ? flatten((List<Object>) o).stream()
                        : Stream.of(o))
                .filter(Objects::nonNull)
                .toList();
    }
}
