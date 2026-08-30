public function anagrams(string word, string[] candidates) returns string[] {
    string[] anagrams = [];

    string[] base_chars = split_sort(word);
    foreach string candidate in candidates {
        if !word.equalsIgnoreCaseAscii(candidate) {
            string[] can_chars = split_sort(candidate);
            if base_chars == can_chars {
                anagrams.push(candidate);
            }
        }
    }

    return anagrams;
}

function split_sort(string word) returns string[] {
    return from string c in word.toLowerAscii() 
        order by c
        select c;
}