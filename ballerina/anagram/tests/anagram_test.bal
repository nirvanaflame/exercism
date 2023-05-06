import ballerina/test;

@test:Config
function noMatches() {
    var candidates = ["hello", "world", "zombies", "pants"];
    var expected = [];
    test:assertEquals(expected, anagrams("diaper", candidates));
}

@test:Config
function detectsTwoAnagrams() {
    var candidates = ["lemons", "cherry", "melons"];
    var expected = ["lemons", "melons"];
    test:assertEquals(expected, anagrams("solemn", candidates));
}

@test:Config
function doesNotDetectAnagramSubsets() {
    var candidates = ["dog", "goody"];
    var expected = [];
    test:assertEquals(expected, anagrams("good", candidates));
}

@test:Config
function detectsAnagram() {
    var candidates = ["enlists", "google", "inlets", "banana"];
    var expected = ["inlets"];
    test:assertEquals(expected, anagrams("listen", candidates));
}

@test:Config
function detectsThreeAnagrams() {
    var candidates = ["gallery", "ballerina", "regally", "clergy", "largely", "leading"];
    var expected = ["gallery", "regally", "largely"];
    test:assertEquals(expected, anagrams("allergy", candidates));
}

@test:Config
function detectsMultipleAnagramsWithDifferentCase() {
    var candidates = ["Eons", "ONES"];
    var expected = ["Eons", "ONES"];
    test:assertEquals(expected, anagrams("nose", candidates));
}

@test:Config
function doesNotDetectNonAnagramsWithIdenticalChecksum() {
    var candidates = ["last"];
    var expected = [];
    test:assertEquals(expected, anagrams("mass", candidates));
}

@test:Config
function detectsAnagramsCaseInsensitively() {
    var candidates = ["cashregister", "Carthorse", "radishes"];
    var expected = ["Carthorse"];
    test:assertEquals(expected, anagrams("Orchestra", candidates));
}

@test:Config
function detectsAnagramsUsingCaseInsensitiveSubject() {
    var candidates = ["cashregister", "carthorse", "radishes"];
    var expected = ["carthorse"];
    test:assertEquals(expected, anagrams("Orchestra", candidates));
}

@test:Config
function detectsAnagramsUsingCaseInsensitivePossibleMatches() {
    var candidates = ["cashregister", "Carthorse", "radishes"];
    var expected = ["Carthorse"];
    test:assertEquals(expected, anagrams("orchestra", candidates));
}

@test:Config
function doesNotDetectAnAnagramIfTheOriginalWordIsRepeated() {
    var candidates = ["go Go GO"];
    var expected = [];
    test:assertEquals(expected, anagrams("go", candidates));
}

@test:Config
function anagramsMustUseAllLettersExactlyOnce() {
    var candidates = ["patter"];
    var expected = [];
    test:assertEquals(expected, anagrams("tapper", candidates));
}

@test:Config
function wordsAreNotAnagramsOfThemselves() {
    var candidates = ["BANANA"];
    var expected = [];
    test:assertEquals(expected, anagrams("BANANA", candidates));
}

@test:Config
function wordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsPartiallyDifferent() {
    var candidates = ["Banana"];
    var expected = [];
    test:assertEquals(expected, anagrams("BANANA", candidates));
}

@test:Config
function wordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsCompletelyDifferent() {
    var candidates = ["banana"];
    var expected = [];
    test:assertEquals(expected, anagrams("BANANA", candidates));
}

@test:Config
function wordsOtherThanThemselvesCanBeAnagrams() {
    var candidates = ["LISTEN", "Silent"];
    var expected = ["Silent"];
    test:assertEquals(expected, anagrams("LISTEN", candidates));
}
