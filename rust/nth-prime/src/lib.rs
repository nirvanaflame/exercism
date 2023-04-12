pub fn nth(n: u32) -> u32 {
    if n == 0 {
        return 2;
    }

    let mut primes: Vec<u32> = Vec::new();
    let mut num= 2;

    while primes.len() < (n + 1) as usize {
        let is_prime = primes.iter().all(|&p| num % p != 0);
        if is_prime {
            primes.push(num);
        }
        num += 1;
    }



    return primes[n as usize];
}
