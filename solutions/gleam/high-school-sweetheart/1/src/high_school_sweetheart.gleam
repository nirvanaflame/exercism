import gleam/string
import gleam/result
import gleam/list

pub fn first_letter(name: String) -> String {
  name |> string.trim |> string.first |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  first_letter(name) |> string.uppercase <> "."
}

pub fn initials(full_name: String) -> String {
  full_name 
  |> string.split(" ") 
  |> list.map(fn(s: String) {initial(s)})
  |> string.join(with: " ")
}

pub fn pair(full_name1: String, full_name2: String) -> String {
  let first = initials(full_name1)
  let second = initials(full_name2)

  let begin = "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **"
 
  let middle = "\n**     " <> first <> "  +  " <> second <> "     **"
 
  let end = "
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  begin <> middle <> end 
}
