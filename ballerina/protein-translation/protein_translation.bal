map<string> translations = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP"
};

public function proteins(string strand) returns string[]|error {
    if strand.length() == 0 {
        return [];
    }

    int strand_len = strand.length();
    if strand_len < 3 {
        return error("Invalid codon");
    }

    string[] result = [];
    string[] chars = from string c in strand select c;
    
    foreach int i in int:range(0, strand_len, 3) {
        if strand_len - i < 3 {
            return error("Invalid codon");
        }

        string[] codes = chars.slice(i, i + 3);
        string code = string:'join("", ...codes);
        if translations.hasKey(code) {
            string full = translations[code] ?: "";
            if full == "STOP" {
                break;
            }
            result.push(full);
        } else {
            return error("Invalid codon");
        }
    }
    return result;
}
