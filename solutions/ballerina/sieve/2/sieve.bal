public function primes(int n) returns int[] {
    if n < 2 {
        return [];
    }
    int[] primes = [2];

    foreach int num in 3...n {
        boolean isPrime = true;
        foreach int p in primes {
            if num % p == 0 {
                isPrime = false;
                break;
            }
        }
        if isPrime {
            primes.push(num);            
        }
    }
    return primes;
}