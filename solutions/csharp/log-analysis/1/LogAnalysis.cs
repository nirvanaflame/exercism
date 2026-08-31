public static class LogAnalysis 
{
    extension(string str)
    {
        // TODO: define the 'SubstringAfter()' extension method on the `string` type
        public string SubstringAfter(string delimiter) => str.Split(delimiter)[1];

        public string SubstringBetween(string start, string end) =>
            str.Split(end)[0][(str.IndexOf(start, StringComparison.Ordinal) + start.Length)..];
        
        public string Message() => str.SubstringAfter(": ");

        public string LogLevel() => str.SubstringBetween("[", "]");
    }
}