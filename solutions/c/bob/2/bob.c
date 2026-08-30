#include "bob.h"

        

          

#include <string.h>

        

          

#include <stdbool.h>

        

          

#include <ctype.h>

        

          

#include <stdio.h>

        

          


        

          

char *hey_bob(char *greeting) {

        

          


        

          

    size_t len = strlen(greeting);

        

          


        

          

    bool flag_empty = true;

        

          

    bool flag_question = false;

        

          

    bool flag_yelling = true;

        

          

    bool yelled = false;

        

          


        

          

    for (size_t i=0; i<len; i++) {

        

          

        char c = greeting[i];

        

          

        if (flag_empty && !isspace(c)) {

        

          

            flag_empty = false;

        

          

        }

        

          

        if (c == '?') {

        

          

            flag_question = true;

        

          

        }        

        

          

        if (isalnum(c)) {

        

          

            flag_question = false;        

        

          

        }

        

          

        if (islower(c)) {

        

          

            flag_yelling = false;

        

          

        }

        

          

        if (isupper(c)) {

        

          

            yelled = true;

        

          

        }        

        

          

    }

        

          

    flag_yelling = flag_yelling && yelled;

        

          


        

          

    if (flag_empty) {

        

          

        return "Fine. Be that way!";

        

          

    }

        

          

    else if (flag_question && !flag_yelling) {

        

          

        return "Sure.";

        

          

    }

        

          

    else if (flag_question && flag_yelling) {

        

          

        return "Calm down, I know what I'm doing!";

        

          

    }

        

          

    else if (flag_yelling) {

        

          

        return "Whoa, chill out!";

        

          

    }

        

          

    else {

        

          

        return "Whatever.";

        

          

    }

        

          


        

          

}