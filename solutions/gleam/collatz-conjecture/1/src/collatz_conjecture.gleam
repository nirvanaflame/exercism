pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number < 1 {
    True -> Error(NonPositiveNumber)
    False -> Ok(do_step(number, 0))
  }
}

fn do_step(number: Int, total_steps: Int) -> Int {
  case number {
    1 -> total_steps
    _ -> {
      case number % 2 == 0 {
        True -> do_step(number / 2, total_steps + 1)
        False -> do_step(number * 3 + 1, total_steps + 1)
      }
    }
  }  
}
