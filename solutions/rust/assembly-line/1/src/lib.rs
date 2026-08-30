pub fn production_rate_per_hour(speed: u8) -> f64 {
    ((221 * speed as u32) as f32 * rate(speed)) as f64
}

fn rate(speed: u8) -> f32 {
    match speed {
        1 | 2 | 3 | 4 => 1.0,
        5 | 6 | 7 | 8 => 0.9,
        _ => 0.77,
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    production_rate_per_hour(speed) as u32 / 60
}
