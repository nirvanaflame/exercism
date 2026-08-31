public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        var tripletsWithSum = new List<(int, int, int)>();

        for (int a = 1; a < sum; a++)
        {
            for (int b = a + 1; b < sum; b++)
            {
                int c = sum - a - b;
                if (a * a + b * b == c * c)
                {
                    tripletsWithSum.Add((a, b, c));
                }
            }
        }
        
        return tripletsWithSum;
    }
}