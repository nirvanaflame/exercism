import java.util.Arrays;
import java.util.List;

public class Anagram {

    private String target;

    public Anagram(String target) {
        this.target = target.toLowerCase();
    }

    public static void main(String[] args) {
        Anagram anagram = new Anagram("listen");
        List<String> list = Arrays.asList("enlists", "google", "inlets", "banana");
        List<String> result = anagram.match(list);
        System.out.println(result.toString());
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
        return str.toLowerCase().chars()
                .sorted()
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
    }
}
