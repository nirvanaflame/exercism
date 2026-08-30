import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn next_player(player: Player) -> Player {
  case player {
    Black -> White
    White -> Black
  }
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let result = 
    rule1(game)
    |> result.map(rule2)
    |> result.try(rule3)
    |> result.try(rule4)
  
  case result {
    Ok(g) -> Game(..g, player: next_player(g.player))
    Error(err) -> Game(..game, error: err)
  }
}
