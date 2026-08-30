public class LogLine {

    LogLevel level;
    String message;
    
    public LogLine(String logLine) {
        level = switch(logLine.substring(1, 4)) {
            case "TRC" -> LogLevel.TRACE;
            case "DBG" -> LogLevel.DEBUG;
            case "INF" -> LogLevel.INFO;
            case "WRN" -> LogLevel.WARNING;
            case "ERR" -> LogLevel.ERROR;
            case "FTL" -> LogLevel.FATAL;
            default -> LogLevel.UNKNOWN;
        };
        message = logLine.substring(7);
    }

    public LogLevel getLogLevel() {
        return level;
    }

    public String getOutputForShortLog() {
        return level.value + ":" + message;
    }
}
