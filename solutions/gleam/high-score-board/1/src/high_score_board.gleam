import gleam/dict.{type Dict, insert, update, delete, map_values}
import gleam/option.{Some, None}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.new() |> insert("The Best Ever", 1_000_000)
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  score_board |> insert(player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  score_board |> delete(player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  let sum = fn(score) {
    case score {
      Some(s) -> s + points
      None -> points
    }
  }

  case dict.has_key(score_board, player) {
    True -> dict.update(score_board, player, sum)
    False -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board |> map_values(fn(_k,v){v+100})
}
