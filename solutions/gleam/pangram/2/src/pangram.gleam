import gleam/string
import gleam/list

pub fn is_pangram(sentence: String) -> Bool {
  let sen = sentence |> string.lowercase

  list.range(97,122)
  |> list.map(to_letter)
  |> list.all(string.contains(sen, _))
}

fn to_letter(codepoint: Int) -> String {
  let assert Ok(letter) = string.utf_codepoint(codepoint)
  string.from_utf_codepoints([letter])
} 