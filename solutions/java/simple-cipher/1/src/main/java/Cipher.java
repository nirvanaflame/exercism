import java.util.Random;

public class Cipher {

    private final String key;

    Cipher() {
        this.key = generateKey();
    }
    Cipher(String key) { this.key = key; }

    public String getKey() { return this.key; }

    public String encode(String input) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            int shiftKey = getShiftKey(i);
            result.appendCodePoint(((input.charAt(i) - 'a' + shiftKey) % 26) + 'a');
        }
        return result.toString();
    }

    public String decode(String input) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            int shiftKey = getShiftKey(i);
            int c = input.charAt(i) - shiftKey;
            if (c < 'a')
                result.appendCodePoint(c + 26);
            else
                result.appendCodePoint(c);
        }
        return result.toString();
    }

    private int getShiftKey(int iteration) {
        char c = key.charAt(iteration % key.length());
        return c - 'a';
    }

    private static String generateKey() {
        return new Random().ints(100, 'a', 'z'-1)
                .collect(
                        StringBuilder::new,
                        StringBuilder::appendCodePoint,
                        StringBuilder::append
                ).toString();
    }

}