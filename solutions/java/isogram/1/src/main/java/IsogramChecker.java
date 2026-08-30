import java.util.Arrays;
import java.util.stream.Collectors;

class IsogramChecker {

    boolean isIsogram(String phrase) {
        String filtered = phrase.replace(" ", "").replace("-", "").toLowerCase();
        String distinct = Arrays.stream(filtered.split(""))
                .distinct()
                .collect(Collectors.joining());
        return distinct.length() == filtered.length();
    }

}
