object Yacht {
  def score(dice: List[Int], category: String): Int = {
    category match {
      case "ones" => dice.filter(_ == 1).sum
      case "twos" => dice.filter(_ == 2).sum
      case "threes" => dice.filter(_ == 3).sum
      case "fours" => dice.filter(_ == 4).sum
      case "fives" => dice.filter(_ == 5).sum
      case "sixes" => dice.filter(_ == 6).sum
      case "full house" => if (List(2,3) == dice.groupBy(identity).view.mapValues(_.size).toMap.values.toList.sorted) dice.sum else 0
      case "four of a kind" => dice.groupBy(identity).view.mapValues(_.size).toMap.find(_._2 >= 4).map(_._1*4).getOrElse(0)
      case "little straight" => if (List(1,2,3,4,5) == dice.sorted) 30 else 0
      case "big straight" => if (List(2,3,4,5,6) == dice.sorted) 30 else 0
      case "choice" => dice.sum
      case "yacht" => if (dice.distinct.length == 1) 50 else 0
    }
  }
}