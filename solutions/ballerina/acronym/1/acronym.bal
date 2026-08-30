import ballerina/io;
import ballerina/regex;

function abbreviate(string phrase) returns string {
    string clean = regex:replaceAll(phrase, "[-_,]+", " ");
    string[] words = regex:split(clean, " ");
    
    string res = "";
    foreach string word in words {
        if word.length() != 0 {
            res += word[0];
        }
    }

    return res.toUpperAscii();
}

public function main() {
    var suk = abbreviate("The Road _Not_ Taken");
    io:println(suk);
}