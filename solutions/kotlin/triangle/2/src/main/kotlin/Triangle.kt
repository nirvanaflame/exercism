import java.lang.IllegalArgumentException

class Triangle<T : Number>(a: T, b: T, c: T) {
    private val sides = listOf(a.toDouble(), b.toDouble(), c.toDouble()).sorted()
    private val sideSize = sides.toSet().size

    val isEquilateral: Boolean = isValid() && sideSize == 1
    val isIsosceles: Boolean = isValid() && sideSize <= 2
    val isScalene: Boolean = isValid() && sideSize == 3

    private fun isValid(): Boolean {
        val (x, y, z) = sides
        val isValid = x * y * z != 0.0 && x + y > z

        if (!isValid) throw IllegalArgumentException()
        return isValid
    }
}
