import java.util.*;

class ProteinTranslator {

    private static final Map<String, String> map = new HashMap<>()
    {{
        put("AUG", "Methionine");
        put("UUU", "Phenylalanine");
        put("UUC", "Phenylalanine");
        put("UUA", "Leucine");
        put("UUG", "Leucine");
        put("UCU", "Serine");
        put("UCC", "Serine");
        put("UCA", "Serine");
        put("UCG", "Serine");
        put("UAU", "Tyrosine");
        put("UAC", "Tyrosine");
        put("UGU", "Cysteine");
        put("UGC", "Cysteine");
        put("UGG", "Tryptophan");
        put("UAA", "STOP");
        put("UAG", "STOP");
        put("UGA", "STOP");
    }};

    List<String> translate(String rnaSequence) {
        int len = rnaSequence.length();
        ArrayList<String> result = new ArrayList<>();
        for (int i = 0; i < len; i+= 3) {
            int j = i + 3;
            if (j <= len) {
                String rna = rnaSequence.substring(i, j);
                String translation = map.get(rna);
                if (Objects.equals(translation, "STOP")) break;
                result.add(translation);
            }
        }
        return result;
    }
}
