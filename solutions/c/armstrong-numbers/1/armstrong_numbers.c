#include "armstrong_numbers.h"


bool is_armstrong_number(int n) {

    if (n < 10) return false;

    int rem = n;
    int factor = 1;
    while ((rem /= 10) > 0) {
        factor += 1;
    }

    rem = n;
    int i = factor;
    int dig = 0;
    int sum = 0;
    while (i > 0) {
        dig = rem % 10;
        rem /= 10;
        sum += dig;
        --i;
    }
    return sum == n;
}