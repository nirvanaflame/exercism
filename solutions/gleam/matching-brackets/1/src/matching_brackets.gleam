import gleam/string
import gleam/list

pub fn is_paired(value: String) -> Bool {
  string.to_graphemes(value)
  |> list.fold([], fn(acc: List(String), x: String) -> List(String) {
    case x {
      "(" -> ["(", ..acc]
      ")" -> pop(acc, "(")
      "[" -> ["[", ..acc]
      "]" -> pop(acc, "[")
      "{" -> ["{", ..acc]
      "}" -> pop(acc, "{")
      _ -> acc
    }
  })
  |> list.length == 0
}

fn pop(stack: List(String), bracket: String) -> List(String) {
  case stack {
    [first, ..rest] if first == bracket -> rest
    _ -> [bracket]
  }
}
