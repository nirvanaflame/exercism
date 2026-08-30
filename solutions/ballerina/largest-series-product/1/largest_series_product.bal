# Find the largest product of the digits of a substring
#
# + digits - the sequence of digits as a string
# + span - the substring size
# + return - the maximum product, or an error
public function largestProduct(string digits, int span) returns int|error {
    if span < 0 {
        return error("span must not be negative");
    } else if span > digits.length() {
        return error("span must be smaller than string length");
    } else if span == 0 {
        return 1;
    }

    var reduce = function(string substring) returns int|error {
        int product = 1;
        foreach string letter in substring {
            var n = int:fromString(letter);
            if n is error {
                return error("digits input must only contain digits");
            } else {
                product *= n;
            }
        }
        return product;
    };
    
    int max = 0;
    foreach int i in int:range(0, digits.length() - span + 1, 1) {
        string window = digits.substring(i, i+span);
        int product = check reduce(window);
        max = int:max(max, product);
    }

    return max;
}

