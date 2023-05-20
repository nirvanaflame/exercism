string[] actions = ["wink", "double blink", "close your eyes", "jump", "reverse"];
function commands(int num) returns string[] {

    string[] res = [];
    int j = 0;
    string binary = toBinary(num);

    int i = binary.length() - 1;
    while i >= 0  {
        string val = binary[i];
        if val == "1" {
            if j == 4 {
                res = res.reverse();
            } else {
                res.push(actions[j]); 
            }
        }
        i -= 1;
        j += 1;
    }

    return res;
}

function toBinary(int num) returns string {
    string res = "";

    int n = num;
    while n > 0 {
        res = (n % 2).toString() + res;
        n /= 2;
    }
    return res;
}
