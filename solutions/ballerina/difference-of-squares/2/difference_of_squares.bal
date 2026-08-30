public function squareOfSum(int n) returns int {
    int sum = 0;
    foreach int i in 0...n {
        sum += i;
    }
    return sum*sum;
}

public function sumOfSquares(int n) returns int {
    int sum = 0;
    foreach int i in 0...n {
        sum += i*i;
    }
    return sum;
}
public function differenceOfSquares(int n) returns int {
    return squareOfSum(n) - sumOfSquares(n);
}
