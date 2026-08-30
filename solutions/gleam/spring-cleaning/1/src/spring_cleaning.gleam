import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  case problem {
    Error(b) -> b
    _ -> panic
  }
}

pub fn remove_team_prefix(team: String) -> String {
  team |> string.crop(" ") |> string.trim
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [first, second] = combined |> string.split(",")
  #(first, second |> string.trim_left |> remove_team_prefix)
}
