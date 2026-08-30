object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = {
    (dnaStrandOne.length, dnaStrandTwo.length) match {
      case (l1, l2) if l1 != l2 => None
      case _ => Some(
        dnaStrandOne.zip(dnaStrandTwo)
             .filter { case (a: Char, b: Char) => a != b }
             .length
        )
    }
  }
}
