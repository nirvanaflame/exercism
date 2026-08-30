pub fn convert(number: Int) -> String {
  iterate("", number)
}

fn iterate(acc: String, number: Int) -> String {
  case number {
    n if n >= 1000 -> iterate(acc <> "M", number - 1000)
    n if n >= 900 -> iterate(acc <> "CM", number - 900)
    n if n >= 500 -> iterate(acc <> "D", number - 500)
    n if n >= 400 -> iterate(acc <> "CD", number - 400)
    n if n >= 100 -> iterate(acc <> "C", number - 100)
    n if n >= 90 -> iterate(acc <> "XC", number - 90)
    n if n >= 50 -> iterate(acc <> "L", number - 50)
    n if n >= 40 -> iterate(acc <> "XL", number - 40)
    n if n >= 10 -> iterate(acc <> "X", number - 10)
    n if n >= 9 -> iterate(acc <> "IX", number - 9)
    n if n >= 5 -> iterate(acc <> "V", number - 5)
    n if n >= 4 -> iterate(acc <> "IV", number - 4)
    n if n >= 1 -> iterate(acc <> "I", number - 1)
    _ -> acc <> ""
  }
}
