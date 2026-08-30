public function score(float x, float y) returns int {
    float position = float:abs(float:sqrt(float:pow(x, 2) + float:pow(y, 2)));
    int points = 0;
    if position <= 1f {
        points = 10;
    } else if position <= 5f {
        points = 5;
    } else if position <= 10f {
        points = 1;
    }
    return points;
}
