public class Robot {

    GridPosition position;
    Orientation orientation;

    public Robot(GridPosition position, Orientation orientation) {
        this.position = position;
        this.orientation = orientation;
    }

    public void turnRight() {
        orientation = switch (orientation) {
            case NORTH -> Orientation.EAST;
            case EAST -> Orientation.SOUTH;
            case SOUTH -> Orientation.WEST;
            case WEST -> Orientation.NORTH;
        };
    }

    public void turnLeft() {
        orientation = switch (orientation) {
            case NORTH -> Orientation.WEST;
            case WEST -> Orientation.SOUTH;
            case SOUTH -> Orientation.EAST;
            case EAST -> Orientation.NORTH;
        };
    }

    public void advance() {
        position = switch (orientation) {
            case NORTH -> new GridPosition(position.x, position.y + 1);
            case SOUTH -> new GridPosition(position.x, position.y - 1);
            case EAST -> new GridPosition(position.x + 1, position.y);
            case WEST -> new GridPosition(position.x - 1, position.y);
        };
    }

    public void simulate(String move) {
        move.chars().forEach(action -> {
            switch (action) {
                case 'R' -> turnRight();
                case 'L' -> turnLeft();
                case 'A' -> advance();
            }
        });
    }

    public GridPosition getGridPosition() {
        return position;
    }

    public Orientation getOrientation() {
        return orientation;
    }
}