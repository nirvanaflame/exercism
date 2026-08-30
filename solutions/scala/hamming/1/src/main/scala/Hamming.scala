object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = {
    if (dnaStrandOne.length() != dnaStrandTwo.length()) return None
    var count = 0
    for ( i <- 0 until dnaStrandOne.length() ) {
      if (dnaStrandOne.charAt(i) != dnaStrandTwo.charAt(i)) count += 1
    }
    return Some(count)
  }
}
