# From: exercism\python\yacht
# Study example from https://exercism.org/tracks/python/exercises/yacht/solutions/slahmar

YACHT = 50
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    dice.sort()
    uniq = len(set(dice))

    if category in (ONES, TWOS, THREES, FOURS, FIVES, SIXES):
        if category not in dice:
            return 0
        return len(list(filter(lambda x: x == category, dice))) * category

    if category == FULL_HOUSE:
        if uniq == 2:
            return sum(dice) if dice[0] == dice[1] and dice[3] == dice[4] else 0
        return 0

    if category == FOUR_OF_A_KIND:
        filter_dice = list(filter(lambda x: x == dice[2], dice))
        return filter_dice[0] * 4 if len(filter_dice) == 4 or uniq ==  1 else 0

    if category == LITTLE_STRAIGHT:
        return 30 if dice[0] == 1 and dice[1] == 2 and dice[2] == 3 and dice[3] == 4 and dice[4] == 5 else 0

    if category == BIG_STRAIGHT:
        return 30 if dice[0] == 2 and dice[1] == 3 and dice[2] == 4 and dice[3] == 5 and dice[4] == 6 else 0

    if category == CHOICE:
        return sum(dice)

    if category == YACHT:
        return 50 if uniq == 1 else 0


if __name__ == '__main__':
    sc = score([6, 6, 4, 6, 6], FOUR_OF_A_KIND)
    print(sc)
