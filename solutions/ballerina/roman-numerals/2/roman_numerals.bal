int[] ARABIC = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
string[] ROMAN = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
function roman(int number) returns string {
    int n = number;

    string romanStr = "";
    foreach int i in 0..<ARABIC.length() {
        while n >= ARABIC[i] {
            romanStr = romanStr + ROMAN[i];
            n -= ARABIC[i];
        }
    }

    return romanStr;
}
