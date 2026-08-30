import java.util.ArrayList;
import java.util.List;

public class LanguageList {
    private final List<String> langs = new ArrayList<>();

    public boolean isEmpty() {
        return langs.isEmpty();
    }

    public void addLanguage(String language) {
        langs.add(language);
    }

    public void removeLanguage(String language) {
        langs.remove(language);
    }

    public String firstLanguage() {
        return langs.get(0);
    }

    public int count() {
        return langs.size();
    }

    public boolean containsLanguage(String language) {
        return langs.contains(language);
    }

    public boolean isExciting() {
        return containsLanguage("Java") || containsLanguage("Kotlin");
    }
}
