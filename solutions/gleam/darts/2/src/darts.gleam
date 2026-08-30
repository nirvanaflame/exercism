import gleam/float
import gleam/result

pub fn score(x: Float, y: Float) -> Int {
  case float.square_root(x *. x +. y *. y) {
    Ok(x) if x <=. 1.0 -> 10
    Ok(x) if x <=. 5.0 -> 5
    Ok(x) if x <=. 10.0 -> 1
    _ -> 0
  }
}
