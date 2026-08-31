static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var idPart = id.HasValue ? $"[{id}] - " : string.Empty ;
        var departmentPart = department?.ToUpperInvariant() ?? "OWNER";
        return $"{idPart}{name} - {departmentPart}"; 
    }
}
