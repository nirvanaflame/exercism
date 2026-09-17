// TODO: define the 'LogLevel' enum

static class LogLine
{
    public static LogLevel ParseLogLevel(string logLine)
    {
        var level = logLine.Split("]:")[0][1..];
        return level switch
        {
            "TRC" => LogLevel.Trace,
            "DBG" => LogLevel.Debug,
            "INF" => LogLevel.Info,
            "WRN" => LogLevel.Warning,
            "ERR" => LogLevel.Error,
            "FTL" => LogLevel.Fatal,
            _ => LogLevel.Unknown
        };
    }

    public static string OutputForShortLog(LogLevel logLevel, string message) => logLevel switch
    {
        LogLevel.Unknown => $"0:{message}",
        LogLevel.Trace => $"1:{message}",
        LogLevel.Debug => $"2:{message}",
        LogLevel.Info => $"4:{message}",
        LogLevel.Warning => $"5:{message}",
        LogLevel.Error => $"6:{message}",
        LogLevel.Fatal => $"42:{message}",
        _ => throw new ArgumentOutOfRangeException(nameof(logLevel), logLevel, null)
    };
}

enum LogLevel
{
    Trace,
    Debug,
    Info,
    Warning,
    Error,
    Fatal,
    Unknown
}
