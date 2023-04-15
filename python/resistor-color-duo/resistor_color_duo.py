col = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

def value(colors):
    first = col.index(colors[0])
    second = str(col.index(colors[1]))
    print(second)
    return int(str(first) if first != 0 else "" + second)


def get_first(n: int) -> str:
    if n == 0:
        return ''
    return str(n)
