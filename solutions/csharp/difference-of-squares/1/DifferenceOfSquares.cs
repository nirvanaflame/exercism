public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(max);
        var sum = max * (max + 1) / 2;
        return sum * sum;
    }

    public static int CalculateSumOfSquares(int max)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(max);
        return max * (max + 1) * (2 * max + 1) / 6;
    }

    public static int CalculateDifferenceOfSquares(int max) =>
        CalculateSquareOfSum(max) - CalculateSumOfSquares(max);
}