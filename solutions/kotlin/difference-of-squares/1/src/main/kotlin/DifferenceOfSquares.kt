class Squares(
    private val n: Int
) {
    fun sumOfSquares(): Int {
        return n * (n + 1) * (2 * n + 1) / 6
    }

    fun squareOfSum(): Int {
        return n * n * (n + 1) * (n + 1) / 4
    }

    fun difference(): Int {
        return squareOfSum() - sumOfSquares()
    }
}
