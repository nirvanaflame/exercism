import gleam/pair
import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  place_location |> pair.swap
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures 
  |> list.filter(fn(treasures: #(String, #(Int, String))) -> Bool {
    pair.swap(place.1) == treasures.1
  })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(f_name, _) = found_treasure
  let #(p_name, _) = place
  let #(d_name, _) = desired_treasure

  case p_name {
    "Abandoned Lighthouse" -> f_name == "Brass Spyglass"
    "Stormy Breakwater" -> f_name == "Amethyst Octopus" && { d_name == "Crystal Crab" || d_name == "Glass Starfish" }
    "Harbor Managers Office" -> f_name == "Vintage Pirate Hat" && { d_name == "Model Ship in Large Bottle" || d_name == "Antique Glass Fishnet Float" }
    _ -> False
  }  
}
