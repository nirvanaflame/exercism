use std::io::repeat;
use std::ops::Mul;

pub fn square(s: u32) -> u64 {
    if s < 1 || s > 64 {
        panic!("Square must be between 1 and 64")
    }

    let mut sum: u64 = 1;
    for _ in 1..s {
        sum *= 2
    }

    return sum
}

pub fn total() -> u64 {
   u64::MAX
}
