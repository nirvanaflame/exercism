import gleam/list
import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna 
  |> string.to_graphemes 
  |> list.map(decode)
  |> list.try_fold("", fn(acc, next) {
    case next {
      Ok(x) -> Ok(acc <> x)
      Error(_) -> Error(Nil)
    }
  })
}

fn decode(nucleotide: String) -> Result(String, Nil) {
  case nucleotide {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
