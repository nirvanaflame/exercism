class Matrix(private val matrixAsString: String) {

    val matrix: List<List<Int>> = matrixAsString
        .split("\n").map {
            it.split(" ").map { s: String -> s.toInt() }.toList()
        }.toList()

    fun column(colNr: Int): List<Int> {
        return matrix.map { it[colNr-1] }.toList()
    }

    fun row(rowNr: Int): List<Int> {
        return matrix[rowNr - 1]
    }
}
