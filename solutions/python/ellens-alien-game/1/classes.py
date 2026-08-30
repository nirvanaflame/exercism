"""Solution to Ellen's Alien Game exercise."""


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    (class)total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Amount of health points.

    Methods
    -------
    hit(): Decrement Alien health by one point.
    is_alive(): Return a boolean for if Alien is alive (if health is > 0).
    teleport(new_x_coordinate, new_y_coordinate): Move Alien object to new coordinates.
    collision_detection(other): Implementation TBD.
    """
    total_aliens_created = 0
    health = 3
    x_coordinate = 0
    y_coordinate = 0

    def __init__(self, x_coordinate, y_coordinate):
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        Alien.total_aliens_created += 1

    def hit(self) -> ():
        self.health = max(0, self.health - 1)

    def is_alive(self) -> bool:
        return self.health > 0

    def teleport(self, new_x, new_y) -> ():
        self.x_coordinate = new_x
        self.y_coordinate = new_y

    def collision_detection(self, alien) -> bool:
        pass


def new_aliens_collection(positions: []) -> list:
    return [Alien(pos[0], pos[1]) for pos in positions]
