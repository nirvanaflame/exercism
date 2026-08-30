pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [] -> 0
    [p] -> 3 + pizza_price(p)
    [_, _] -> do_order_price(order, 2)
    _ -> do_order_price(order, 0)
  }
}

fn do_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..rest] -> do_order_price(rest, acc + pizza_price(pizza))
  }
}
