public static class SquareRoot
{
    public static int Root(int number)
    {
        int i = 1;
        while (i * i != number && i <= number / 2)  
        {
            i++;
        }

        return i;
    }
}
