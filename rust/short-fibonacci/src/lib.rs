/// Create an empty vector
pub fn create_empty() -> Vec<u8> {
    Vec::new()
}

/// Create a buffer of `count` zeroes.
///
/// Applications often use buffers when serializing data to send over the network.
pub fn create_buffer(count: usize) -> Vec<u8> {
    vec![0;count]
}

/// Create a vector containing the first five elements of the Fibonacci sequence.
///
/// Fibonacci's sequence is the list of numbers where the next number is a sum of the previous two.
/// Its first five elements are `1, 1, 2, 3, 5`.
pub fn fibonacci() -> Vec<u8> {
    let mut fib_seq = Vec::with_capacity(5);

    let mut prev2 = 0;
    let mut prev1 = 1;
    for mut _i in 0..5 {
        let next = prev1 + prev2;
        prev2 = prev1;
        prev1 = next;
        fib_seq.push(prev2);
        _i += 1;
    }
    fib_seq
}
