import java.util.ArrayList;
import java.util.List;

public class Flattener {

    public List<Object> flatten(List<Object> list) {
        var flat = new ArrayList<>();

        for (Object element : list) {

            if (element instanceof List) {
                flat.addAll(flatten((List<Object>) element));
            } else if (element != null) {
                flat.add(element);
            }
        }
        return flat;
    }
}
