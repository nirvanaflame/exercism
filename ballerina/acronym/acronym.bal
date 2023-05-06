function abbreviate(string phrase) returns string {
    string:RegExp delimeter = re `[\s\-_]+`;
    string[] c = delimeter.split(phrase).'map(w => w[0]);
    return string:'join("", ...c).toUpperAscii();
}