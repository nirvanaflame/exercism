import gleam/string
import gleam/list

pub fn is_paired(value: String) -> Bool {
  string.to_graphemes(value)
  |> list.fold([], match)
  |> list.length == 0
}

fn match(acc: List(String), next: String) -> List(String) {
  case next {
    "(" -> ["(", ..acc]
    ")" -> pop(acc, "(")
    "[" -> ["[", ..acc]
    "]" -> pop(acc, "[")
    "{" -> ["{", ..acc]
    "}" -> pop(acc, "{")
    _ -> acc
  }
}

fn pop(stack: List(String), bracket: String) -> List(String) {
  case stack {
    [first, ..rest] if first == bracket -> rest
    _ -> [bracket]
  }
}
