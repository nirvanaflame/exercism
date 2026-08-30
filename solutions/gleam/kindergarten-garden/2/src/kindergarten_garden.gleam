import gleam/string
import gleam/list

pub fn main() {
  plants("RR\nVG", Alice)
}

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  let student_index: Int = find_student_index(student) * 2
  
  diagram
  |> string.split("\n")
  |> list.fold([], fn(res: List(Plant), row: String) {
    row
    |> string.to_graphemes
    |> list.index_fold(res, fn(acc: List(Plant), item: String, index: Int) -> List(Plant) {
      case student_index == index || student_index + 1 == index {
        True -> [push(item), ..acc]
        False -> acc
      }
    })
  })
  |> list.reverse
}

fn push(x: String) -> Plant {
  case x {
    "R" -> Radishes
    "C" -> Clover
    "V" -> Violets
    "G" -> Grass
    _ -> panic
  }
}

fn find_student_index(student: Student) -> Int {
 case student {
    Alice -> 0
    Bob -> 1
    Charlie -> 2
    David -> 3
    Eve -> 4
    Fred -> 5
    Ginny -> 6
    Harriet -> 7
    Ileana -> 8
    Joseph -> 9
    Kincaid -> 10
    Larry -> 11 
  }
}
