class Squares(
    private val n: Int
) {

    fun sumOfSquares() = n * (n + 1) * (2 * n + 1) / 6

    fun squareOfSum() = n * n * (n + 1) * (n + 1) / 4

    fun difference() = squareOfSum() - sumOfSquares()
}

// Implement your functions here
fun subtractTwoNumbers(a: Long, b: Long) = print(a - b)


fun sumTwoNumbers(a: Long, b: Long) = print(a + b)


fun divideTwoNumbers(a: Long, b: Long) = if (b == 0L) print("Division by 0!") else print(a / b)


fun multiplyTwoNumbers(a: Long, b: Long) = print(a * b)

