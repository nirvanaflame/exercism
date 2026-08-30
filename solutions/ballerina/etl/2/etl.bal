public function transform(map<string[]> old) returns map<int> {
    map<int> temp = {};
    foreach var entry in old.entries() {
        foreach string c in entry[1] {
            var s = int:fromString(entry[0]);
            if s is error {
            } else {
                temp[c.toLowerAscii()] = s; 
            }
        }
    }
    return temp;
}
