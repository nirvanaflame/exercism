import java.util.Arrays;
import java.util.List;

public class Anagram {

    private String target;

    public Anagram(String target) {
        this.target = target.toLowerCase();
    }

    public List<String> match(List<String> list) {
        return list.stream()
            .filter(word -> !word.toLowerCase().equals(target))
            .filter(this::isAnagram)
            .toList();
    }

    private boolean isAnagram(String word) {
        return encode(word).equals(encode(target));
    }

    private String encode(String str) {
        return str.toLowerCase().chars().sorted()
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
    }
}