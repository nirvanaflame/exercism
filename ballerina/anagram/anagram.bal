public function anagrams(string word, string[] candidates) returns string[] {
    string[] anagrams = [];

    int[] enc = word.toLowerAscii().toCodePointInts().sort();
    foreach string candidate in candidates {
        if !word.equalsIgnoreCaseAscii(candidate) {
            int[] c = candidate.toLowerAscii().toCodePointInts().sort();
            if enc.toString() == c.toString() {
                anagrams.push(candidate);
            }
        }
    }

    return anagrams;
}