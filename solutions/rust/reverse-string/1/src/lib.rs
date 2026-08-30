pub fn reverse(input: &str) -> String {
    let mut res = String::new();

    for c in input.chars().rev() {
        res.push(c);
    }

    return res;
}
