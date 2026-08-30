import gleam/regex
import gleam/list
import gleam/string
import gleam/result

pub fn clean(input: String) -> Result(String, String) {
  input
  |> check_punctuation
  |> result.try(check_alpha)
  |> result.try(get_content)
  |> result.try(check_length)
  |> result.try(check_format)
}

fn check_format(input: String) -> Result(String, String) {
  let assert Ok(area_code) = input |> string.first
  let assert Ok(exchange_code) = string.drop_left(input, 3) |> string.first

  case area_code, exchange_code {
    a, _ if a == "0" -> Error("area code cannot start with zero")
    a, _ if a == "1" -> Error("area code cannot start with one")
    _, e if e == "0" -> Error("exchange code cannot start with zero")
    _, e if e == "1" -> Error("exchange code cannot start with one")
    _, _ -> Ok(input)
  }
}

fn check_punctuation(input: String) -> Result(String, String) {
  let assert Ok(re) = regex.from_string("[@:!]+")
  case regex.check(re, input) {
    True -> Error("punctuations not permitted")
    False -> Ok(input)
  }
}

fn check_alpha(input: String) -> Result(String, String) {
  let assert Ok(re) = regex.from_string("[a-zA-Z]+")
  case regex.check(re, input) {
    True -> Error("letters not permitted")
    False -> Ok(input)
  }
}

fn check_length(input: String) -> Result(String, String) {
  let len = string.length(input)
  case len {
    l if l == 10 -> Ok(input)
    l if l == 11 -> check_11_digits(input)
    l if l < 10 -> Error("must not be fewer than 10 digits")
    _ -> Error("must not be greater than 11 digits")
  }
}

fn check_11_digits(input: String) -> Result(String, String) {
  case input {
    "1" <> rest -> Ok(rest)
    _ -> Error("11 digits must start with 1")
  }
}

fn get_content(input: String) -> Result(String, String) {
  let assert Ok(re) = regex.from_string("[\\d]+")
  
  let content = regex.scan(re, input)
  |> list.map(fn(match) {
    match.content
  })
  |> string.concat
  
  Ok(content)
}
