import java.util.stream.Collectors;

class Atbash {

    public String encode(String phrase) {
        return phrase
                .toLowerCase()
                .replaceAll("\\W", "")
                .chars()
                .mapToObj(x -> String.valueOf((char) cipher(x)))
                .collect(Collectors.joining())
                .replaceAll("(.{5})", "$1 ")
                .trim();
    }

    public String decode(String phrase) {
        return phrase
                .toLowerCase()
                .replaceAll("\\W", "")
                .chars()
                .mapToObj(x -> String.valueOf((char) cipher(x)))
                .collect(Collectors.joining());
    }

    private int cipher(int letter) {
        return Character.isLetter(letter)
                ? 'z' - (letter - 'a')
                : letter;
    }
}