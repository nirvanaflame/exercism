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

    string[] sorted_keys = temp.keys().sort();
    map<int> result = {};
    foreach string key in sorted_keys {
        result[key] = temp[key] ?: 0;
    }

    return result;
}
