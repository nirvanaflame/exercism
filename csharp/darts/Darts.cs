public static class Darts
{
    public static int Score(double x, double y)
    {
        var radius = Math.Sqrt(x * x + y * y);
        return radius switch
        {
            <= 1.0 => 10,
            <= 5.0 => 5,
            <= 10.0 => 1,
            _ => 0
        };
    }
}
