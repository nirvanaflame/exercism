pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  wines |> list_filter(keeping: fn(wine){wine.color == color})
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  wines |> list_filter(fn(wine){wine.country == country})
}

pub fn filter(wines: List(Wine), color color: Color,  country country: String) -> List(Wine) {
  wines |> wines_of_color(color) |> wines_from_country(country)
}

fn list_filter(wines: List(a), keeping predicate: fn(a) -> Bool) -> List(a) {
  case wines {
    [] -> []
    [head, ..tail] -> {
      case predicate(head) {
        True -> [head, ..list_filter(tail, predicate)]
        False -> list_filter(tail, predicate)   
      }
    }   
  }
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
