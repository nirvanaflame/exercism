#include <string.h>
#include <stdlib.h>
#include "reverse_string.h"


char *reverse(const char *value) {
    if (!value) return "";
    int str_len = strlen(value) + 1;
    int end_char_pos = str_len - 2; // account for '\0'
    char * rev = (char *) malloc(str_len);
    
    for(int i = 0; i < str_len; i++) {
        rev[i] = value[end_char_pos - i];
    }

    return rev;
}