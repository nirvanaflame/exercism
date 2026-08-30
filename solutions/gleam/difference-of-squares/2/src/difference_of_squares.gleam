import gleam/function.{identity}

pub fn square_of_sum(n: Int) -> Int {
  sum(n, identity)
  |> pow2
}

fn sum(n: Int, f: fn(Int) -> Int) -> Int {
  case n {
    1 -> 1
    _ -> f(n) + sum(n - 1, f)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  sum(n, pow2)
}

fn pow2(n: Int) -> Int {
  n * n
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
