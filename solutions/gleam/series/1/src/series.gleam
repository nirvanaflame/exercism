import gleam/string
import gleam/list

pub type Error {
  SliceLengthZero
  SliceLengthTooLarge
  SliceLengthNegative
  EmptySeries
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  case string.length(input), size {
    l, _ if l == 0 -> Error(EmptySeries)
    _, s if s == 0 -> Error(SliceLengthZero)
    l, s if l < s -> Error(SliceLengthTooLarge)
    _, s if s < 0 -> Error(SliceLengthNegative) 
    _, _ -> Ok(slice(input, size))
  }
}

fn slice(input: String, size: Int) -> List(String) {
  input 
  |> string.to_graphemes
  |> list.window(size)
  |> list.map(string.concat)
}