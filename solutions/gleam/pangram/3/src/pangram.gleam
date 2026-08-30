import gleam/string
import gleam/list

pub fn is_pangram(sentence: String) -> Bool {
  let sen = sentence |> string.lowercase

  "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes
  |> list.all(string.contains(sen, _))
} 