pub fn is_armstrong_number(num: u32) -> bool {
    let s = num.to_string();
    let len = s.len() as u32;
    let sum = s.chars()
                .map(|c| (c.to_digit(10).unwrap() as u64).pow(len))
                .sum::<u64>();
    num as u64 == sum
}
