function collatzSteps(int n) returns int|error {
    if n < 1 {
        return error("Only positive integers are allowed");
    }

    int step = 0;
    int number = n;
    while number != 1 {
        if number % 2 == 0 {
            number /= 2;
        } else {
            number = 3 * number + 1;
        }
        step += 1;
    }
    
    return step;
}
