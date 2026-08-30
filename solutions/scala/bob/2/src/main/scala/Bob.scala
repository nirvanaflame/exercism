object Bob {
  def response(statement: String): String = {
    val str = statement.trim
    if (str.isEmpty) return "Fine. Be that way!"
    
    val isQuestion = str.endsWith("?")
    val isShout = str.exists(_.isLetter) && str == str.toUpperCase

    (isQuestion, isShout) match {
      case (true, true) => "Calm down, I know what I'm doing!" 
      case (_, true) => "Whoa, chill out!"
      case (true, _) => "Sure."
      case _ => "Whatever."
    }
  }
}
