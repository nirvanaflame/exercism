import gleam/string
import gleam/dict
import gleam/list
import gleam/option.{Some, None}

pub fn is_pangram(sentence: String) -> Bool {
  let increment = fn(x) {
    case x {
      Some(i) -> i + 1
      None -> 0
    }
  }

  let mem = "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes
  |> list.fold(dict.new(), fn(acc, next){
    dict.insert(acc, next, 1)
  })

  sentence 
  |> string.lowercase
  |> string.replace(".", "")
  |> string.replace("1", "")
  |> string.replace("2", "")
  |> string.to_graphemes
  |> list.fold(mem, fn(acc, next){
    dict.update(acc, next, increment)
  })
  |> dict.values
  |> list.all(fn(v){v > 1})
}