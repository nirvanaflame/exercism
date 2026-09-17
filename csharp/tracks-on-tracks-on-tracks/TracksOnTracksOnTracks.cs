public static class Languages
{
    private static List<string> arr = [];

    public static List<string> NewList() => arr = [];

    public static List<string> GetExistingLanguages() => arr = ["C#", "Clojure", "Elm"];

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        var result = new string("string".Reverse().ToArray());
        
            "string".Length
       
        
        languages.Add(language);
        return languages;
    }

    public static int CountLanguages(List<string> languages) => languages.Count();

    public static bool HasLanguage(List<string> languages, string language) => languages.Contains(language);

    public static List<string> ReverseList(List<string> languages)
    {
        languages.Reverse();
        return languages;
    }

    public static bool IsExciting(List<string> languages)
    {
        return languages.Count > 0 && (
            languages[0].Equals("C#")
            || (languages[1].Equals("C#") && languages.Count is 2 or 3)
        );
    }

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        languages.Remove(language);
        return languages;
    }

    public static bool IsUnique(List<string> languages)
    {
        return languages.Count == languages.Distinct().Count();
    }
}