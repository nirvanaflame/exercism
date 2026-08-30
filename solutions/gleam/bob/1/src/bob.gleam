import gleam/string

pub fn hey(remark: String) -> String {
  case is_question(remark), is_yell(remark), is_silence(remark) {
    _, _, True -> "Fine. Be that way!"
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."  
    _, True, _ -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}

fn is_question(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.ends_with("?")
}

fn is_yell(remark: String) -> Bool {
  let r = remark
  |> string.trim
  |> string.uppercase

  r == remark && string.lowercase(remark) != remark
}

fn is_silence(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.is_empty
}
