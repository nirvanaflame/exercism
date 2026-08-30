col = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]


def value(colors: list):
    first = get_first(col.index(colors[0]))
    second = str(col.index(colors[1]))
    return int(first + second)


def get_first(n: int) -> str:
    if n == 0:
        return ''
    return str(n)
