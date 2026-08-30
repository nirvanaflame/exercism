public class RomanNumerals {

    private static final int[] ARABIC_NUMERALS = new int[]{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};

    private static final String[] ROMAN_NUMERALS = new String[]{"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

    private final int number;

    public RomanNumerals(int number) {
        this.number = number;
    }

    public String getRomanNumeral() {
        String romanNumeral = "";
        int n = number;
        for (int i = 0; i < ARABIC_NUMERALS.length; i++) {
            while (n >= ARABIC_NUMERALS[i]) {
                romanNumeral += ROMAN_NUMERALS[i];
                n -= ARABIC_NUMERALS[i];
            }
        }
        return romanNumeral;
    }
}