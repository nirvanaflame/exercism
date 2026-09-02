public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        if (sum <= 0)
        {
            yield break;
        }
        for (int a = 1; a <= (sum - 1) / 3; a++)
        {
            for (int b = a + 1; b <= (sum - a - 1) / 2; b++)
            {
                int c = sum - a - b;
                if (a * a + b * b == c * c)
                {
                   yield return (a, b, c);
                }
            }
        }
    }
}