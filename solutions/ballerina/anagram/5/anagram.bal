public function anagrams(string word, string[] candidates) returns string[] {
    return from string candidate in candidates
        where word.toLowerAscii() != candidate.toLowerAscii() 
            && char_order(word) == char_order(candidate)
        select candidate;
}

function char_order(string word) returns string[] {
    return from string c in word.toLowerAscii() 
        order by c
        select c;
}
