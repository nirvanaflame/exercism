import java.util.HashMap;
import java.util.Map;

public class Say {

    private static final String[] DIGITS = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
    private static final String[] TENS = {"", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
    private static final String[] THOUSANDS = {"", "thousand", "million", "billion"};

    private static final Map<Integer, String> NUM_TO_WORD = new HashMap<>() {
        {
            put(0, "zero");
            put(1, "one");
            put(2, "two");
            put(3, "three");
            put(4, "four");
            put(5, "five");
            put(6, "six");
            put(7, "seven");
            put(8, "eight");
            put(9, "nine");
            put(10, "ten");
            put(11, "eleven");
            put(12, "twelve");
            put(13, "thirteen");
            put(14, "fourteen");
            put(15, "fifteen");
            put(16, "sixteen");
            put(17, "seventeen");
            put(18, "eighteen");
            put(19, "nineteen");
            put(20, "twenty");
            put(30, "thirty");
            put(40, "forty");
            put(50, "fifty");
            put(60, "sixty");
            put(70, "seventy");
            put(80, "eighty");
            put(90, "ninety");
        }
    };

    public String say(long number) {
        if (number < 0 || number > 999_999_999_999L) {
            throw new IllegalArgumentException("Number must be between 0 and 999,999,999,999");
        }
        if (number == 0) {
            return "zero";
        }
        String words = "";
        int i = 0;
        while (number > 0) {
            int n = (int) (number % 1000);
            if (n != 0) {
                words = spellChunk(n) + " " + THOUSANDS[i] + " " + words;
            }
            i++;
            number /= 1000;
        }
        return words.trim();
    }

    private static String spellChunk(int number) {
        if (number == 0) {
            return "";
        } else if (number < 20) {
            return NUM_TO_WORD.get(number);
        } else if (number == 20) {
            return NUM_TO_WORD.get(number);
        } else if (number < 100) {
            return TENS[number / 10] + "-" + spellChunk(number % 10);
        } else {
            return DIGITS[number / 100] + " hundred " + spellChunk(number % 100);
        }
    }
}
