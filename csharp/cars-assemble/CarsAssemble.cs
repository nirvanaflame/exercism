static class AssemblyLine
{
    public static double SuccessRate(int speed)
    {
        if (speed == 10)
        {
            return 0.77;
        }

        if (speed == 9)
        {
            return 0.8;
        }

        if (speed > 4)
        {
            return 0.9;
        }

        return speed > 0 ? 1.0 : 0.0;
    }

    public static double ProductionRatePerHour(int speed)
    {
        return speed * 221.0 * SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)(ProductionRatePerHour(speed) / 60.0);
    }
}