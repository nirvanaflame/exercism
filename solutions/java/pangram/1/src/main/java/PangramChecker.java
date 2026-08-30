import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;

public class PangramChecker {

    public boolean isPangram(String input) {
        return input
                .toLowerCase()
                .replaceAll("[^a-z]+", "")
                .chars()
                .boxed()
                .collect(Collectors.toSet())
                .size() >= 26;
    }

}
