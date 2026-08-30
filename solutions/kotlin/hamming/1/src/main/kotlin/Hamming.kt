object Hamming {

  fun compute(leftStrand: String, rightStrand: String): Int {
    if (leftStrand.length != rightStrand.length) {
      throw IllegalArgumentException("left and right strands must be of equal length")
    }

    var count = 0
    var i = 0
    while (i < leftStrand.length) {
      if (leftStrand[i] != rightStrand[i]) {
        count++
      }
      i++
    }
    return count

  }
}
