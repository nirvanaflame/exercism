function abbreviate(string phrase) returns string {
    string:RegExp delimeter = re `[\s\-_]+`;
    string[] words = delimeter.split(phrase);
    return string:'join("", ...words.map(word => word[0].toUpperAscii()));
}