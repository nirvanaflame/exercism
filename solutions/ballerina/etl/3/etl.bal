public function transform(map<string[]> old) returns map<int> {
    return map from [string,string[]] entry in old.entries()
        from string letter in entry[1]
        let string key = letter.toLowerAscii()
        let int rate = i_dont_care_about_error(entry[0])
        order by key
        select [key, rate];

}

function i_dont_care_about_error(string number) returns int {
    int|error n = int:fromString(number);
    if n is error {
        // I don't care
        return 0;
    } else {
        return n;
    }
}