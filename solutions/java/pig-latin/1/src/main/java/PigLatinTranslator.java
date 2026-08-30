import java.util.Arrays;
import java.util.stream.Collectors;

class PigLatinTranslator {

    public String translate(String phrase) {
        String[] words = phrase.split(" ");
        return Arrays.stream(words).map(this::encode).collect(Collectors.joining(" "));
    }

    private String encode(String word) {
        if (word.substring(0, 2).equals("xr")) {
            return "xrayay";
        }
        if (word.charAt(0) == 'y' && isContains("aeiou", word.charAt(1))) {
            word = rotate(word);
        }
        while (!isContains("aeiouy", word.charAt(0))) {
            word = rotate(word);
        }
        if (word.charAt(word.length() - 1) == 'q' && word.charAt(0) == 'u') {
            word = rotate(word);
        }
        return word + "ay";
    }

    private static boolean isContains(String patter, char ch) {
        return patter.contains(String.valueOf(ch));
    }

    private String rotate(String word) {
        return word.substring(1) + word.charAt(0);
    }
}
