function collatzSteps(int n) returns int|error {
    if n < 1 {
        return error("Only positive integers are allowed");
    }
    return count_steps(n, 0);
}

function count_steps(int n, int step) returns int {
        if n == 1 { return step; }
        else if n % 2 == 0 { return count_steps(n/2, step+1); }
        else { return count_steps(3 * n + 1, step + 1); }
}
