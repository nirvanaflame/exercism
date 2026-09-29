import java.util.HashMap;
import java.util.Map;

public class DialingCodes {

    private final Map<Integer, String> codes = new HashMap<>();

    public Map<Integer, String> getCodes() {
        return codes;
    }

    public void setDialingCode(Integer code, String country) {
        codes.put(code, country);
    }

    public String getCountry(Integer code) {
        return codes.get(code);
    }

    public void addNewDialingCode(Integer code, String country) {
        if (codes.containsKey(code)) {
            return;
        }

        var currentCode = findDialingCode(country);
        if (currentCode == null) {
            codes.put(code, country);
        }
    }

    public Integer findDialingCode(String country) {
        return codes.entrySet()
            .stream()
            .filter(entry -> country.equals(entry.getValue()))
            .findFirst()
            .map(Map.Entry::getKey)
            .orElse(null);
    }

    public void updateCountryDialingCode(Integer code, String country) {
        var oldCode = findDialingCode(country);
        if (oldCode != null) {
            codes.put(code, country);
            codes.remove(oldCode);
        }
    }
}
