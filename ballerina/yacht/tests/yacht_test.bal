import ballerina/test;

@test:Config
function testYacht() {
    int result = score([5, 5, 5, 5, 5], "yacht");
    int expected = 50;
    test:assertEquals(result, expected);
}

@test:Config
function testNotYacht() {
    int result = score([1, 3, 3, 2, 5], "yacht");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testOnes() {
    int result = score([1, 1, 1, 3, 5], "ones");
    int expected = 3;
    test:assertEquals(result, expected);
}

@test:Config
function testOnesOutOfOrder() {
    int result = score([3, 1, 1, 5, 1], "ones");
    int expected = 3;
    test:assertEquals(result, expected);
}

@test:Config
function testNoOnes() {
    int result = score([4, 3, 6, 5, 5], "ones");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testTwos() {
    int result = score([2, 3, 4, 5, 6], "twos");
    int expected = 2;
    test:assertEquals(result, expected);
}

@test:Config
function testFours() {
    int result = score([1, 4, 1, 4, 1], "fours");
    int expected = 8;
    test:assertEquals(result, expected);
}

@test:Config
function testYachtCountedAsThrees() {
    int result = score([3, 3, 3, 3, 3], "threes");
    int expected = 15;
    test:assertEquals(result, expected);
}

@test:Config
function testYachtOf3sCountedAsFives() {
    int result = score([3, 3, 3, 3, 3], "fives");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testFives() {
    int result = score([1, 5, 3, 5, 3], "fives");
    int expected = 10;
    test:assertEquals(result, expected);
}

@test:Config
function testSixes() {
    int result = score([2, 3, 4, 5, 6], "sixes");
    int expected = 6;
    test:assertEquals(result, expected);
}

@test:Config
function testFullHouseTwoSmallThreeBig() {
    int result = score([2, 2, 4, 4, 4], "full house");
    int expected = 16;
    test:assertEquals(result, expected);
}

@test:Config
function testFullHouseThreeSmallTwoBig() {
    int result = score([5, 3, 3, 5, 3], "full house");
    int expected = 19;
    test:assertEquals(result, expected);
}

@test:Config
function testTwoPairIsNotAFullHouse() {
    int result = score([2, 2, 4, 4, 5], "full house");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testFourOfAKindIsNotAFullHouse() {
    int result = score([1, 4, 4, 4, 4], "full house");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testYachtIsNotAFullHouse() {
    int result = score([2, 2, 2, 2, 2], "full house");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testFourOfAKind() {
    int result = score([6, 6, 4, 6, 6], "four of a kind");
    int expected = 24;
    test:assertEquals(result, expected);
}

@test:Config
function testYachtCanBeScoredAsFourOfAKind() {
    int result = score([3, 3, 3, 3, 3], "four of a kind");
    int expected = 12;
    test:assertEquals(result, expected);
}

@test:Config
function testFullHouseIsNotFourOfAKind() {
    int result = score([3, 3, 3, 5, 5], "four of a kind");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testLittleStraight() {
    int result = score([3, 5, 4, 1, 2], "little straight");
    int expected = 30;
    test:assertEquals(result, expected);
}

@test:Config
function testLittleStraightAsBigStraight() {
    int result = score([1, 2, 3, 4, 5], "big straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testFourInOrderButNotALittleStraight() {
    int result = score([1, 1, 2, 3, 4], "little straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testNoPairsButNotALittleStraight() {
    int result = score([1, 2, 3, 4, 6], "little straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testMinimumIs1MaximumIs5ButNotALittleStraight() {
    int result = score([1, 1, 3, 4, 5], "little straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testBigStraight() {
    int result = score([4, 6, 2, 5, 3], "big straight");
    int expected = 30;
    test:assertEquals(result, expected);
}

@test:Config
function testBigStraightAsLittleStraight() {
    int result = score([6, 5, 4, 3, 2], "little straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testNoPairsButNotABigStraight() {
    int result = score([6, 5, 4, 3, 1], "big straight");
    int expected = 0;
    test:assertEquals(result, expected);
}

@test:Config
function testChoice() {
    int result = score([3, 3, 5, 6, 6], "choice");
    int expected = 23;
    test:assertEquals(result, expected);
}

@test:Config
function testYachtAsChoice() {
    int result = score([2, 2, 2, 2, 2], "choice");
    int expected = 10;
    test:assertEquals(result, expected);
}
