import java.util.Arrays;
import java.util.List;
import java.util.regex.MatchResult;
import java.util.regex.Pattern;
import java.util.stream.IntStream;

class Series {

    String input;

    Series(String string) {
        this.input = string;
    }

    List<String> slices(int num) {
        int len = input.length();
        if (num < 1) throw new IllegalArgumentException("Slice size is too small.");
        if (len < num) throw new IllegalArgumentException("Slice size is too big.");

        return IntStream.rangeClosed(0, len - num)
                .mapToObj(i -> input.substring(i, i + num))
                .toList();
    }
}
