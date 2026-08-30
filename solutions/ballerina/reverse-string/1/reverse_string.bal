public function reverse(string str) returns string {
    string reversed = "";
    int length = str.length();
    foreach int i in 0 ..< length {
        reversed += str[length - 1 - i].toString();
    }
    return reversed;
}