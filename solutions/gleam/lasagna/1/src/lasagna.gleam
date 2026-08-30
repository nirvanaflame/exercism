pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(time: Int) -> Int {
  expected_minutes_in_oven() - time
}

pub fn preparation_time_in_minutes(layers_number: Int) -> Int {
  layers_number * 2
}

pub fn total_time_in_minutes(layers_number: Int, prep_time: Int) -> Int {
  preparation_time_in_minutes(layers_number) + prep_time
}

pub fn alarm() -> String {
  "Ding!"
}