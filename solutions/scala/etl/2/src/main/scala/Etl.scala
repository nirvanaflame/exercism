object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] = {
    for {
      (score, strings) <- scoreMap
      str <- strings
    } yield (str.toLowerCase, score)
  }
}
