public type Position record {
    int x;
    int y;
};

public enum Direction {
    NORTH, EAST, SOUTH, WEST
}

public type Robot record {|
    Position position;
    Direction direction;
|};

public function newRobot(Position position = {x: 0, y: 0}, Direction direction = NORTH) returns Robot {
    return {
        position: position,
        direction: direction
    };
}

public function move(Robot robot, string instructionSeq) returns Robot {
    string[] instructions = from string s in instructionSeq select s;
    foreach string instruction in instructions {
        match [instruction, robot.direction] {
            ["R", NORTH] => { robot.direction = EAST; }
            ["R", EAST] => { robot.direction = SOUTH; }
            ["R", SOUTH] => { robot.direction = WEST; }
            ["R", WEST] => { robot.direction = NORTH; } 
            ["L", NORTH] => { robot.direction = WEST; }
            ["L", WEST] => { robot.direction = SOUTH; }
            ["L", SOUTH] => { robot.direction = EAST; }
            ["L", EAST] => { robot.direction = NORTH; }
        }
        if instruction == "A" {
            Position pos = robot.position;
            match [robot.direction] {
                [NORTH] => { 
                    robot.position = {
                        x: pos.x,
                        y: pos.y + 1
                    };
                }   
                [SOUTH] => { 
                    robot.position = {
                        x: pos.x,
                        y: pos.y - 1
                    };
                }   
                [EAST] => { 
                    robot.position = {
                        x: pos.x + 1,
                        y: pos.y
                    };
                }   
                [WEST] => { 
                    robot.position = {
                        x: pos.x - 1,
                        y: pos.y
                    };
                }
            }
        }
    } 

    return robot; 
}
