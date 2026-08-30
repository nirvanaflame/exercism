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
        if (Character.isLetter(c)) {
            int next = c + key;

            if (Character.isLowerCase(c) && next > 122) {
                next = key - (122 - c) - 1;
                return 'a' + next;
            } else if (Character.isUpperCase(c) && next > 90) {
                next = key - (90 - c) - 1;
                return 'A' + next;
            } else {
                return next;
            }
        }
        return c;
    }
}
