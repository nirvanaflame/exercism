import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.0} /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case [left, right] {
    [Fahrenheit(a), Celsius(b)] -> float.compare(fahrenheit_to_celsius(a), b)
    [Celsius(a), Fahrenheit(b)] -> float.compare(a, fahrenheit_to_celsius(b))
    [Celsius(a), Celsius(b)] -> float.compare(a, b)
    [Fahrenheit(a), Fahrenheit(b)] -> float.compare(a, b)
    _ -> order.Eq
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(a: City, b: City) {
    compare_temperature(a.temperature, b.temperature)
  })
}
