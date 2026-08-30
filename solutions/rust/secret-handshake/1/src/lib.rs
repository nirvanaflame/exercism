pub fn actions(number: u8) -> Vec<&'static str> {
    let mut start_mask = 0b00001;
    let mut buffer = Vec::new();

    while start_mask != 0b10000 {
        let match_number = start_mask & number;
        let buffer_item = match match_number {
            0b0001 => Some("wink"),
            0b0010 => Some("double blink"),
            0b0100 => Some("close your eyes"),
            0b1000 => Some("jump"),
            _ => None,
        };
        buffer.push(buffer_item);
        start_mask <<= 1;
    }

    if number & 0b10000 != 0 {
        buffer.reverse();
    }

    buffer.into_iter().flatten().collect()
}