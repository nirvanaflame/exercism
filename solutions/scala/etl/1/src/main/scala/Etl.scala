object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] = {
    var result = Map[String, Int]()
    for ((key, seq) <- scoreMap) {
      for (s <- seq) {
        result += (s.toLowerCase -> key)
      }
    }
    return result
  }
}
