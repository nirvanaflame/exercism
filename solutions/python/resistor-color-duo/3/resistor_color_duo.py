col = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]


def value(colors: list):
    return col.index(colors[0]) * 10 + col.index(colors[1])
