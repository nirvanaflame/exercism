import gleam/list
import gleam/int

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1)
  |> list.filter(fn(x){ list.any(factors, fn(y){ y > 0 && x % y == 0}) })
  |> int.sum
}
