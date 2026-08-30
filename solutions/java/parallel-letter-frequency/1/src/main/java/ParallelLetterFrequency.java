import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

class ParallelLetterFrequency {

   String[] text;
    
    ParallelLetterFrequency(String[] texts) {
        this.text = texts;
    }

    Map<Character, Integer> countLetters() {
        return Arrays.stream(text)
            .parallel()
            .map(str -> str.trim().toLowerCase())
            .flatMapToInt(String::codePoints)
            .filter(Character::isAlphabetic)
            .mapToObj(code -> String.valueOf(Character.toChars(code)))
            .collect(Collectors.toMap(s -> s.charAt(0), s -> 1, Integer::sum));
    }
}
