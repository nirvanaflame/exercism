public function squareOfSum(int n) returns int {
    int sum = 0;
    foreach int i in 0...n {
        sum += i;
    }

    float f = <float>sum;
    int res = <int>f.pow(2);
    return res;
}

public function sumOfSquares(int n) returns int {
    float sum = 0;
    foreach int i in 0...n {

        sum += (<float>i).pow(2);
    }

    return <int>sum;
}

public function differenceOfSquares(int n) returns int {
    return squareOfSum(n) - sumOfSquares(n);
}
