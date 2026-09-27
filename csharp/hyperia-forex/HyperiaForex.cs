public struct CurrencyAmount
{
    private decimal amount;
    private string currency;

    public CurrencyAmount(decimal amount, string currency)
    {
        this.amount = amount;
        this.currency = currency;
    }

    public static bool operator ==(CurrencyAmount a, CurrencyAmount b) => DoOrThrow(a, b, () => a.amount == b.amount);

    public static bool operator !=(CurrencyAmount a, CurrencyAmount b) => DoOrThrow(a, b, () => a.amount != b.amount);

    public static bool operator >(CurrencyAmount a, CurrencyAmount b) => DoOrThrow(a, b, () => a.amount > b.amount);

    public static bool operator <(CurrencyAmount a, CurrencyAmount b) => DoOrThrow(a, b, () => a.amount < b.amount);

    public static CurrencyAmount operator +(CurrencyAmount a, CurrencyAmount b) => 
        DoOrThrow(a, b, () => new CurrencyAmount(a.amount + b.amount, a.currency));

    public static CurrencyAmount operator -(CurrencyAmount a, CurrencyAmount b) =>
        DoOrThrow(a, b, () => new CurrencyAmount(a.amount - b.amount, a.currency));

    public static CurrencyAmount operator *(CurrencyAmount a, CurrencyAmount b) =>
        DoOrThrow(a, b, () => new CurrencyAmount(a.amount * b.amount, a.currency));
    
    public static CurrencyAmount operator /(CurrencyAmount a, CurrencyAmount b) =>
        DoOrThrow(a, b, () => new CurrencyAmount(a.amount / b.amount, a.currency));

    public static implicit operator double(CurrencyAmount a) => (double)a.amount;

    public static implicit operator decimal(CurrencyAmount a) => a.amount;

    private static T DoOrThrow<T>(CurrencyAmount a, CurrencyAmount b, Func<T> action) => 
        a.currency != b.currency ? throw new ArgumentException() : action();
}