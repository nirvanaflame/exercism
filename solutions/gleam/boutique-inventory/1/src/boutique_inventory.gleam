import gleam/iterator.{type Iterator, map, filter, fold}

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  items |> map(fn(item: Item) {item.name})
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  items |> filter(fn(item: Item) {item.price < 30})
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  items |> filter(fn(item: Item) {item.quantity == 0})
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  items |> fold(from: 0, with: fn(acc: Int, item: Item) {acc + item.quantity})
}
