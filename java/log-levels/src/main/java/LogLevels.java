public class LogLevels {

    public static String message(String logLine) {
        var col = logLine.indexOf(':');
        return logLine.substring(col + 1).trim();
    }

    public static String logLevel(String logLine) {
        var begin = logLine.indexOf('[');
        var end = logLine.indexOf(']');

        return logLine.substring(begin + 1, end).trim().toLowerCase();
    }

    public static String reformat(String logLine) {
        return String.format("%s (%s)", message(logLine), logLevel(logLine));
    }
}
