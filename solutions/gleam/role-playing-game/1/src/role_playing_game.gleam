import gleam/option.{type Option, Some, None}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, option.is_some(player.mana) {
    0, True -> Some(Player(..player, health: 100, mana: Some(100)))
    0, False -> Some(Player(..player, health: 100))
    _, _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case option.is_some(player.mana) {
    True -> calculate_damage(player, cost)
    False -> #(Player(..player, health: calculate_health(player.health, cost)), 0)
  }
}

fn calculate_damage(player: Player, cost: Int) -> #(Player, Int) {
  let m = option.unwrap(player.mana, 0)
  case m > cost {
    True -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    False -> #(player, 0)
  }
}

fn calculate_health(current: Int, damage: Int) -> Int {
  case current > damage {
    True -> current - damage
    False -> 0
  }
}