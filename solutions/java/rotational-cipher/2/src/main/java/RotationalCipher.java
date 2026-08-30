import java.util.stream.Collectors;

class RotationalCipher {

    int key;

    RotationalCipher(int shiftKey) {
        key = shiftKey;
    }

    String rotate(String data) {
        return data.chars()
                .map(this::shift)
                .mapToObj(Character::toString)
                .collect(Collectors.joining());
    }

    private int shift(int c) {
        if (!Character.isLetter(c)) {
            return c;
        }
        char first = Character.isUpperCase(c) ? 'A' : 'a';
        return first + (c + key - first) % 26;
    }
}
