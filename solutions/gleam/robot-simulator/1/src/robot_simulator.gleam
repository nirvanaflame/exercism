import gleam/string
import gleam/result

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let res: Result(#(String, String), Nil) = string.pop_grapheme(instructions)

  result.map(over: res, with: fn(tuple: #(String, String)) {
    case tuple.0 {
      "R" -> move(turn_right(direction), position, tuple.1)
      "L" -> move(turn_left(direction), position, tuple.1)
      "A" -> move(direction, change_position(direction, position), tuple.1)
      _ -> create(direction, position)
    }
  })
  |> result.unwrap(create(direction, position))
}

fn turn_right(direction: Direction) -> Direction {
  case direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
}

fn turn_left(direction: Direction) -> Direction {
  case direction {
    North -> West
    West -> South
    South -> East
    East -> North
  }
}

fn change_position(direction: Direction, position: Position) -> Position {
  case direction {
    North -> Position(position.x, position.y + 1)
    East -> Position(position.x + 1, position.y)
    South -> Position(position.x, position.y - 1)
    West -> Position(position.x - 1, position.y)
  }
}

