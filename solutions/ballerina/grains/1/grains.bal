public function square(int n) returns float|error {
    if n < 1 || n > 64 {
        return error("Invalid square");
    }

    return float:pow(2f, <float>(n - 1));
}

public function total() returns float {
    float|error result = square(64);
    if result is error {
        // do nothing
    } else {
        return result + 1f + result;
    }

    return 1f;
}
