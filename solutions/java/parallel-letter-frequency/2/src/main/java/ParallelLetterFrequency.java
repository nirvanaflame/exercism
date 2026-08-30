import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.concurrent.ConcurrentHashMap;

class ParallelLetterFrequency {

   String[] text;
    
    ParallelLetterFrequency(String[] texts) {
        this.text = texts;
    }

    Map<Character, Integer> countLetters() {
        var result = new ConcurrentHashMap<Character, Integer>();
        for (String line : text) {
            try {
                Thread.ofPlatform().start(() -> {
                    var codePoints = line
                        .codePoints()
                        .filter(Character::isAlphabetic)
                        .map(Character::toLowerCase)
                        .toArray();
                    try {
                        Thread.ofVirtual().start(() -> {
                            for (int point : codePoints) {
                                var chars = Character.toChars(point);
                                var ch = String.valueOf(chars).charAt(0);
                                result.merge(ch, 1, Integer::sum);
                            }
                        }).join();
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }).join();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }
}
