
public function hey(string input) returns string {
    string to_test = input.trim();

    if to_test == "" {
        return "Fine. Be that way!";
    }
    
    [boolean, boolean] [question, shout] = [is_question(to_test), is_shout(to_test)];

    if question && shout {
        return "Calm down, I know what I'm doing!";
    } else if question {
        return "Sure.";
    } else if shout {
        return "Whoa, chill out!";
    }

    return "Whatever.";
}

function is_question(string s) returns boolean {
    return s.endsWith("?");
}

function is_shout(string s) returns boolean {
    int[] letters = s.toCodePointInts().filter(l => 65 <= l && l <= 90);
    string yell = s.toUpperAscii();

    return yell == s && letters.length() > 0;
}