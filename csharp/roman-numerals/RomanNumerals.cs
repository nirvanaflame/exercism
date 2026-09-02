
public static class RomanNumeralExtension
{
    private static int[] ARABIC_NUMERALS = new int[]{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    private static string[] ROMAN_NUMERALS = new string[]{"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
    
    public static string ToRoman(this int value)
    {
        var roman = "";
        for (int i = 0; i < ARABIC_NUMERALS.Length; i++)
        {
            while (value >= ARABIC_NUMERALS[i])
            {
                roman += ROMAN_NUMERALS[i];
                value -= ARABIC_NUMERALS[i];
            }
        }

        return roman;
    }
    
}