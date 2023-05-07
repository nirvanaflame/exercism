// explanations: https://exercism.org/tracks/kotlin/exercises/roman-numerals/approaches/fold-repeat
object RomanNumerals {
    fun value(n: Int) = mapping()
        .fold(Pair(StringBuilder(), n)) { (output, runnyNum), (value, numeral) ->
            when {
                runnyNum >= value ->
                    output.append(numeral.repeat(runnyNum / value)) to
                            runnyNum % value
                else -> output to runnyNum
            }
        }
        .first
        .toString()

    private fun mapping() = listOf(
        1000 to "M",
        900 to "CM",
        500 to "D",
        400 to "CD",
        100 to "C",
        90 to "XC",
        50 to "L",
        40 to "XL",
        10 to "X",
        9 to "IX",
        5 to "V",
        4 to "IV",
        1 to "I"
    )
}
