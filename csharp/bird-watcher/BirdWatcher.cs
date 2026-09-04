class BirdCount
{
    private int[] _birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        _birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek() => [0, 2, 5, 3, 7, 8, 4];

    public int Today() => _birdsPerDay[^1];

    public void IncrementTodaysCount() => _birdsPerDay[^1] += 1;

    public bool HasDayWithoutBirds() => _birdsPerDay.Any(x => x == 0);

    public int CountForFirstDays(int numberOfDays) => _birdsPerDay.Take(numberOfDays).Sum();

    public int BusyDays() => _birdsPerDay.Count(x => x >= 5);
}
