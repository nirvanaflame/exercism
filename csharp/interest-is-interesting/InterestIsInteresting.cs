static class SavingsAccount
{
    public static float InterestRate(decimal balance) => balance switch 
    {
        < 0 => 3.213f,
        < 1_000 => 0.5f,
        < 5_000 => 1.621f,
        _ => 2.475f
    };

    public static decimal Interest(decimal balance) => (decimal)InterestRate(balance) / 100 * balance;

    public static decimal AnnualBalanceUpdate(decimal balance) => balance + Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        if (balance >= targetBalance)
        {
            return 0;
        }
        return 1 + YearsBeforeDesiredBalance(AnnualBalanceUpdate(balance), targetBalance);
    }
}