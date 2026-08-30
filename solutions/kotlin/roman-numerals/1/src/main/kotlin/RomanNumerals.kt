object RomanNumerals {

    private val ARABIC_NUMERALS = intArrayOf(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)

    private val ROMAN_NUMERALS = arrayOf("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")


    fun value(n: Int): String {
        var num = n;
        val sb = StringBuilder()
        ARABIC_NUMERALS.forEachIndexed { i, x ->
            run {
                while (num >= x) {
                    sb.append(ROMAN_NUMERALS[i])
                    num -= x
                }
            }
        }
        return sb.toString()
    }
}
