"""Solution to Ellen's Alien Game exercise."""


class Alien:

    total_aliens_created = 0

    def __init__(self, x_coordinate, y_coordinate):
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        self.health = 3
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
    return [Alien(x, y) for (x, y) in positions]
