public function transform(map<string[]> old) returns map<int> {
    return map from [string,string[]] entry in old.entries()
        from string letter in entry[1]
        let string key = letter.toLowerAscii()
        let int|error rate = int:fromString(entry[0])
        where rate is int
        order by key
        select [key, rate];
}