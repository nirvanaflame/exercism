import gleam/list
import gleam/int
import gleam/bit_array
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna 
  |> list.map(encode_nucleotide) 
  |> list.fold(<<>>, fn(acc, x){ <<acc:bits, x:size(2)>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  list_decode(dna, [])
}

fn list_decode(
  dna: BitArray,
  acc: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok(list.reverse(acc))
    <<head:2, tail:bits>> -> {
      case decode_nucleotide(head) {
        Ok(nucleotide) -> list_decode(tail, [nucleotide, ..acc])
        Error(e) -> Error(e)
      }
    }
    _ -> Error(Nil)
  }
}