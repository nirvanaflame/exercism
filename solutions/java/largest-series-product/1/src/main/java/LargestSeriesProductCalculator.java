import java.util.Arrays;

class LargestSeriesProductCalculator {

    String inputNumber;

    LargestSeriesProductCalculator(String inputNumber) {
        if (!inputNumber.equals("") && !inputNumber.matches("[\\d]+")) {
            throw new IllegalArgumentException("String to search may only contain digits.");
        }
        this.inputNumber = inputNumber;
    }

    long calculateLargestProductForSeriesLength(int numberOfDigits) {
        int length = inputNumber.length();
        if (numberOfDigits < 1) {
            throw new IllegalArgumentException("Series length must be non-negative.");
        }
        if (length < numberOfDigits) {
            throw new IllegalArgumentException("Series length must be less than or equal to the length of the string to search.");
        }

        long[] mem = new long[length - numberOfDigits + 1];

        int k = 0;
        for (int i = 0; i <= length - numberOfDigits; i++) {
            mem[k++] = sumOfWindow(inputNumber.substring(i, numberOfDigits + i));
        }

        return Arrays.stream(mem).max().getAsLong();
    }

    private long sumOfWindow(String substring) {
        return Arrays.stream(substring.split(""))
                .mapToLong(Long::parseLong)
                .reduce((acc, x) -> acc * x).getAsLong();
    }
}
