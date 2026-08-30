import gleam/int.{power}
import gleam/result.{unwrap}
import gleam/float.{truncate}
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
  power(n, 2.0)
  |> unwrap(0.0)
  |> truncate()
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
