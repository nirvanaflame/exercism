import static java.lang.String.format;
import static java.util.stream.Collectors.joining;
import static java.util.stream.IntStream.range;

class Proverb {

    String[] words;

    Proverb(String[] words) {
        this.words = words;
    }

    String recite() {
        if (words.length == 0) return "";

        return range(0, words.length - 1)
                .mapToObj(i -> format("For want of a %s the %s was lost.\n", words[i], words[i + 1]))
                .collect(joining())
                .concat(format("And all for the want of a %s.", words[0]));

    }
}
