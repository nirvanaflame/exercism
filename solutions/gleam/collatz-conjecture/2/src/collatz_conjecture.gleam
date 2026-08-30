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
  case number, number % 2 {
    1, _ -> total_steps
    _, 0 -> do_step(number / 2, total_steps + 1)
    _, 1 -> do_step(3 * number + 1, total_steps + 1)
    _, _ -> total_steps
  }
}
