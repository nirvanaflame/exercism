using System.Text;
using System.Text.RegularExpressions;

public static class Identifier
{
    extension(string str)
    {
        private string RemoveLowerGreek() =>
            new(str
                .Where(ch => ch is < 'α' or > 'ω')
                .ToArray()
            );

        private string ReplaceAll(string pattern, string newValue) =>
            Regex.Replace(str, pattern, newValue);

        private string Capitalize() => 
            new StringBuilder()
            .Append(str.Substring(0, 1).ToUpper())
            .Append(str.Substring(1))
            .ToString();

        private string ToCamelCase()
        {
            var strings = str.Split("-");
            return strings
                .Skip(1)
                .Aggregate(new StringBuilder(), (sb, ch) => sb.Append(ch.Capitalize()))
                .Insert(0, strings.First()).ToString();
        }
    }

    public static string Clean(string identifier)
    {
        return identifier.Replace(" ", "_")
            .Replace("\0", "CTRL")
            .ToCamelCase()
            .ReplaceAll(@"[^\p{L}_]", "")
            .RemoveLowerGreek();
    }
}