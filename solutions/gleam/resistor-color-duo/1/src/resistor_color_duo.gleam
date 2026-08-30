import gleam/list
import gleam/string
import gleam/int

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [] -> Error(Nil)
    [_] -> Error(Nil)
    _ -> get_value(colors)
  }
}

fn get_value(colors: List(Color)) -> Result(Int, Nil) {
  colors 
  |> list.take(2) 
  |> list.map(encode)
  |> list.map(int.to_string)
  |> string.concat
  |> int.parse
}

fn encode(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}