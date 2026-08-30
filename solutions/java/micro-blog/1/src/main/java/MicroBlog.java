import static java.nio.charset.StandardCharsets.UTF_16;

class MicroBlog {
    public String truncate(String s) {
        int maxLength = 5;

        int length = s.codePointCount(0, s.length());
        if (length > maxLength) {
            int endIndex = s.offsetByCodePoints(0, maxLength);
            s = s.substring(0, endIndex);
        }

        return s;
    }
}
