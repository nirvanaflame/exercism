public function transform(map<string[]> old) returns map<int> {
    return map from [string,string[]] entry in old.entries()
        let int|error rate = int:fromString(entry[0])
        from string letter in entry[1]
        let string key = letter.toLowerAscii()
        where rate is int
        order by key
        select [key, rate];
}