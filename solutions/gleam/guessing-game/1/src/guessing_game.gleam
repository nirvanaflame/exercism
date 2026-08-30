pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    x if x < 41 -> "Too low"
    x if x > 40 && x < 44 -> "So close"
    _ -> "Too high"
  }
}
