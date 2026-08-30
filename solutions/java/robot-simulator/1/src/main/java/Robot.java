import static java.util.Arrays.stream;

public class Robot {

    GridPosition position;
    Orientation orientation;

    public Robot(GridPosition position, Orientation orientation) {
        this.position = position;
        this.orientation = orientation;
    }

    public void turnRight() {
        switch (orientation) {
            case NORTH -> orientation = Orientation.EAST;
            case EAST -> orientation = Orientation.SOUTH;
            case SOUTH -> orientation = Orientation.WEST;
            case WEST -> orientation = Orientation.NORTH;
        }
    }

    public void turnLeft() {
        switch (orientation) {
            case NORTH -> orientation = Orientation.WEST;
            case WEST -> orientation = Orientation.SOUTH;
            case SOUTH -> orientation = Orientation.EAST;
            case EAST -> orientation = Orientation.NORTH;
        }
    }

    public void advance() {
        switch (orientation) {
            case NORTH -> position = new GridPosition(position.x, position.y + 1);
            case SOUTH -> position = new GridPosition(position.x, position.y - 1);
            case EAST -> position = new GridPosition(position.x + 1, position.y);
            case WEST -> position = new GridPosition(position.x - 1, position.y);
        }
    }

    public void simulate(String move) {
        stream(move.split("")).forEach(action -> {
            switch (action) {
                case "R" -> turnRight();
                case "L" -> turnLeft();
                case "A" -> advance();
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