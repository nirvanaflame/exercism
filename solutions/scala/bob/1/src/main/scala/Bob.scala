object Bob {
  def response(st: String): String = st.trim match {
    case s if (question(s) && yell(s)) => "Calm down, I know what I'm doing!"
    case s if (question(s)) => "Sure."
    case s if (yell(s)) => "Whoa, chill out!"
    case s if (s.isEmpty) => "Fine. Be that way!"
    case _ => "Whatever."
  }

  def question(str: String): Boolean = (str takeRight 1) == "?"
  def yell(str: String): Boolean = {
    val cls = str.replaceAll("[^a-zA-Z]+", "")
    cls.toUpperCase == cls && !cls.isEmpty
  }
}
