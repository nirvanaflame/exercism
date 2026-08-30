import ballerina/regex;

public function isIsogram(string sentence) returns boolean {
    string cleaned = regex:replaceAll(sentence, "[\\W]+","").toLowerAscii();
    int len = cleaned.length();

    map<int> mem = {};
    int[] codes = cleaned.toCodePointInts();
    foreach int code in codes {
        mem[code.toString()] = code;
    }

    return mem.keys().length() == len;
}
