import gleam/int
import gleam/list
import gleam/result
import gleam/float

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = number |> int.digits(10)
  let len = digits |> list.length

  let sum = digits 
  |> list.map(pow(_, len)) 
  |> int.sum

  number == sum
}

fn pow(base: Int, of exponent: Int) -> Int {
  base
  |> list.repeat(exponent)
  |> list.fold(1, int.multiply)
}