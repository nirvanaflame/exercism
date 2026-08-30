class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int x) => ExpectedMinutesInOven() - x; 

    public int PreparationTimeInMinutes(int x) => x * 2;

    public int ElapsedTimeInMinutes(int x, int y) => x * 2 + y;
}
