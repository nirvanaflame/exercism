import gleam/string
import gleam/list

pub fn is_paired(value: String) -> Bool {
  string.to_graphemes(value)
  |> list.fold([], match)
  |> list.length == 0
}

fn match(acc: List(String), next: String) -> List(String) {
  case next {
    "(" | "[" | "{" -> [next, ..acc]
    ")" | "]" | "}" -> try_pop(next, acc)
    _ -> acc
  }
}

fn try_pop(bracket: String, stack: List(String)) -> List(String) {
  let reversed = reverse(bracket)
  case stack {
    [first, ..rest] if first == reversed -> rest
    _ -> [bracket]
  }
}

fn reverse(bracket: String) -> String {
  case bracket {
    ")" -> "("
    "]" -> "["
    "}" -> "{"
    _ -> ""
  }
}
