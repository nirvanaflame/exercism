import ballerina/test;

@test:Config
function createRobotAtOriginFacingNorth() {
    Robot robot = newRobot({"x": 0, "y": 0}, NORTH);
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function createRobotAtNetativePositionFacingSouth() {
    Robot robot = newRobot({"x": -1, "y": -1}, SOUTH);
    test:assertEquals(robot.position, {"x": -1, "y": -1});
    test:assertEquals(robot.direction, SOUTH);
}

@test:Config
function createRobotWithDefaultAttributes() {
    Robot robot = newRobot();
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function rotatingClockwiseChangesNorthToEast() {
    Robot robot = newRobot();
    robot = move(robot, "R");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, EAST);
}

@test:Config
function rotatingClockwiseChangesEastToSouth() {
    Robot robot = newRobot(direction = EAST);
    robot = move(robot, "R");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, SOUTH);
}

@test:Config
function rotatingClockwiseChangesSouthToWest() {
    Robot robot = newRobot(direction = SOUTH);
    robot = move(robot, "R");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, WEST);
}

@test:Config
function rotatingClockwiseChangesWestToNorth() {
    Robot robot = newRobot(direction = WEST);
    robot = move(robot, "R");
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function rotatingCounterClockwiseChangesNorthToWest() {
    Robot robot = newRobot();
    robot = move(robot, "L");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, WEST);
}

@test:Config
function rotatingCounterClockwiseChangesEastToNorth() {
    Robot robot = newRobot(direction = EAST);
    robot = move(robot, "L");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function rotatingCounterClockwiseChangesSouthToEast() {
    Robot robot = newRobot(direction = SOUTH);
    robot = move(robot, "L");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, EAST);
}

@test:Config
function rotatingCounterClockwiseChangesWestToSouth() {
    Robot robot = newRobot(direction = WEST);
    robot = move(robot, "L");
    test:assertEquals(robot.position, {"x": 0, "y": 0});
    test:assertEquals(robot.direction, SOUTH);
}

@test:Config
function movingForwardFacingNorthIncrementsY() {
    Robot robot = newRobot();
    robot = move(robot, "A");
    test:assertEquals(robot.position, {"x": 0, "y": 1});
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function movingForwardFacingSouthDecrementsY() {
    Robot robot = newRobot(direction = SOUTH);
    robot = move(robot, "A");
    test:assertEquals(robot.position, {"x": 0, "y": -1});
    test:assertEquals(robot.direction, SOUTH);
}

@test:Config
function movingForwardFacingEastIncrementsX() {
    Robot robot = newRobot(direction = EAST);
    robot = move(robot, "A");
    test:assertEquals(robot.position, {"x": 1, "y": 0});
    test:assertEquals(robot.direction, EAST);
}

@test:Config
function movingForwardFacingWestDecrementsX() {
    Robot robot = newRobot(direction = WEST);
    robot = move(robot, "A");
    test:assertEquals(robot.position, {"x": -1, "y": 0});
    test:assertEquals(robot.direction, WEST);
}

@test:Config
function movingEastAndNorthFromREADME() {
    Robot robot = newRobot({"x": 7, "y": 3}, NORTH);
    robot = move(robot, "RAALAL");
    test:assertEquals(robot.position, {"x": 9, "y": 4});
    test:assertEquals(robot.direction, WEST);
}

@test:Config
function movingWestAndNorth() {
    Robot robot = newRobot({"x": 0, "y": 0}, NORTH);
    robot = move(robot, "LAAARALA");
    test:assertEquals(robot.position, {"x": -4, "y": 1});
    test:assertEquals(robot.direction, WEST);
}

@test:Config
function movingWestAndSouth() {
    Robot robot = newRobot({"x": 2, "y": -7}, EAST);
    robot = move(robot, "RRAAAAALA");
    test:assertEquals(robot.position, {"x": -3, "y": -8});
    test:assertEquals(robot.direction, SOUTH);
}

@test:Config
function movingEastAndNorth() {
    Robot robot = newRobot({"x": 8, "y": 4}, SOUTH);
    robot = move(robot, "LAAARRRALLLL");
    test:assertEquals(robot.position, {"x": 11, "y": 5});
    test:assertEquals(robot.direction, NORTH);
}

@test:Config
function invalidInstructionsAreIgnored() {
    Robot robot = newRobot();
    robot = move(robot, "GOFASTER"); // valid instructions are "A" and "R"
    test:assertEquals(robot.position, {"x": 0, "y": 1});
    test:assertEquals(robot.direction, EAST);
}

