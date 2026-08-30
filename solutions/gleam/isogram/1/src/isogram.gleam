import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let alpha_numeric = phrase 
    |> string.replace(each: "-", with: "") 
    |> string.replace(each: " ", with: "")
    |> string.lowercase

  let unique = alpha_numeric |> string.to_graphemes |> list.unique |> list.length
  
string.length(alpha_numeric) == unique 
}
