import gleam/float
import gleam/result

pub fn score(x: Float, y: Float) -> Int {
  let position: Float = {x *. x +. y *. y} 
    |> float.square_root 
    |> result.map(float.absolute_value) 
    |> result.unwrap(0.0)

  case position {
    x if x <=. 1.0 -> 10
    x if x <=. 5.0 -> 5
    x if x <=. 10.0 -> 1
    _ -> 0
  }
}
