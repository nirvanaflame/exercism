import gleam/set.{type Set, insert, delete}
import gleam/list
import gleam/string
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let after_trade = collection |> delete(my_card) |> insert(their_card)
  case set.contains(collection, my_card), set.contains(collection, their_card) {
    True, False -> #(True, after_trade)
    True, True -> #(False, after_trade)
    False, _ -> #(False, after_trade)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(fn(first, next){
    set.intersection(first, next)
  })
  |> result.map(fn(x){set.to_list(x)})
  |> result.unwrap([])
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(fn(first, next) {
    set.union(first, next)
  })
  |> result.map(fn(x){set.size(x)})
  |> result.unwrap(0)
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection |> set.filter(fn(x){ string.starts_with(x, "Shiny ")})
}
