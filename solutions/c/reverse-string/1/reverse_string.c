#include "reverse_string.h"
#include <stdio.h>

char[] reverse(char[] in) {

    int len = strlen(in);
    for(int i = 0, int j = len - 1; i < j; i++, j--) {
        char x = in[i];
        in[i] = in[j];
        in[j] = x;
    }

    return in;
}