public static class LineUp
{
    public static string Format(string name, int number) =>
        $"{name}, you are the {number}{Suffix(number)} customer we serve today. Thank you!";

    private static string Suffix(int number) => number switch
    {
        var a when a % 100 is 11 or 12 or 13 => "th",
        var a when a % 10 == 1 => "st",
        var a when a % 10 == 2 => "nd",
        var a when a % 10 == 3 => "rd",
        _ => "th"
    };
}