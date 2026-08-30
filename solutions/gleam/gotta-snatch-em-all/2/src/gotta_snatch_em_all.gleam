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
  #(
    set.contains(collection, my_card) && !set.contains(collection, their_card),
    collection |> delete(my_card) |> insert(their_card)
  )
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections 
  |> list.reduce(set.intersection) 
  |> result.map(set.to_list)
  |> result.unwrap([])
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(set.union)
  |> result.map(set.size)
  |> result.unwrap(0)
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection |> set.filter(string.starts_with(_, "Shiny "))
}
