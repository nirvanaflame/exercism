def equilateral(sides):
    a, b, c = sides
    return False if not is_triangle(sides) \
        else a is b and a is c and b is c


def isosceles(sides):
    a, b, c = sides

    if not is_triangle(sides):
        return False

    if equilateral(sides):
        return True

    return (a == b and a != c) \
        or (a != b and a == c) \
        or (b == c and a != c)


def scalene(sides):
    a, b, c = sides

    return is_triangle(sides) and a is not b and b is not c and a is not c


def is_triangle(sides):
    a, b, c = sides
    if a == 0 and b == 0 and c == 0:
        return False;

    return a + b >= c \
        and b + c >= a \
        and a + c >= b
