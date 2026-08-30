import gleam/string
import gleam/list

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

  string.to_graphemes(instructions)
  |> list.fold(create(direction, position), fn(robot: Robot, instraction: String) {
    case instraction {
      "R" -> create(turn_right(robot.direction), robot.position)
      "L" -> create(turn_left(robot.direction), robot.position)
      "A" -> create(robot.direction, change_position(robot.direction, robot.position))
      _ -> robot
    }
  })
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
