class Triangle<T : Number>(val a: T, val b: T, val c: T) {

    val x = a.toDouble()
    val y = b.toDouble()
    val z = b.toDouble()

    val sides = listOf(x, y, z).sorted()
    val sideSize = setOf(sides).size

    val isEquilateral: Boolean = isValid() && sideSize == 1
    val isIsosceles: Boolean = isValid() && sideSize <= 2
    val isScalene: Boolean = isValid() && sideSize == 3

    fun isValid(): Boolean {
        return sides.slice(0..1).sum() > sides[2]

    }
}
