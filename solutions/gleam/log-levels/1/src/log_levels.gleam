import gleam/list
import gleam/result
import gleam/string

pub fn message(log_line: String) -> String {
  log_line
  |> string.split(on: "]:")
  |> list.last()
  |> result.unwrap("")
  |> string.trim()
}

pub fn log_level(log_line: String) -> String {
  let tupl =
    log_line
    |> string.split(on: "]:")
    |> list.first()
    |> result.unwrap("")
    |> string.trim()
    |> string.pop_grapheme()
    |> result.unwrap(#("", ""))

  string.lowercase(tupl.1)
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " " <> "(" <> log_level(log_line) <> ")"
}
