import ballerina/test;

@test:Config
function emptyStrands() {
    test:assertEquals(distance("", ""), 0);
}

@test:Config
function singleLetterIdenticalStrands() {
    test:assertEquals(distance("A", "A"), 0);
}

@test:Config
function singleLetterDifferentStrands() {
    test:assertEquals(distance("G", "T"), 1);
}

@test:Config
function longIdenticalStrands() {
    test:assertEquals(distance("GGACTGAAATCTG", "GGACTGAAATCTG"), 0);
}

@test:Config
function longDifferentStrands() {
    test:assertEquals(distance("GGACGGATTCTG", "AGGACGGATTCT"), 9);
}

@test:Config
function disallowFirstStrandLonger() {
    var result = distance("AATG", "AAA");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config
function disallowSecondStrandLonger() {
    var result = distance("ATA", "AGTG");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config
function disallowEmptyFirstStrand() {
    var result = distance("", "G");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config
function disallowEmptySecondStrand() {
    var result = distance("G", "");
    if result is error {
        test:assertEquals(result.message(), "Unequal strand lengths");
    } else {
        test:assertFail("Expected an error");
    }
}
