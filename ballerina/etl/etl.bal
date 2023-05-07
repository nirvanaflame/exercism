import ballerina/io;

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

    var s = 
        from var entry in old.entries()
        from string key in entry[1]
        let string k = key.toLowerAscii()
        let int rate = i_dont_care_about_error(entry[0])
        order by k
        select { [k]: rate };

    io:println(s);
    return {};
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


public function main() {
        map<string[]> input = {
        "1": ["A", "E"],
        "2": ["D", "G"]
    };

    var res = transform(input);
    io:println(res);
}
