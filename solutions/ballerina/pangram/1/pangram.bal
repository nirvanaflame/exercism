public function isPangram(string sentence) returns boolean {
    map<()> mem = {};
    sentence.toUpperAscii()
        .toCodePointInts()
        .filter(code => 65 <= code && code <= 90)
        .forEach(function (int x) {
            mem[x.toString()] = ();
        });
    return mem.length() == 26;
}
