col = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]


def label(colors):
    suf = "0" * col.index(colors[2])
    num = first(colors) + str(col.index(colors[1])) + suf

    zeroes = count_zeroes(num)

    num = int(num)
    if zeroes < 3:
        num = str(int(num)) + " ohms"
    elif zeroes < 6:
        num /= 1000
        num = str(int(num)) + " kiloohms"
    elif zeroes < 9:
        num /= 1_000_000
        num = str(int(num)) + " megaohms"
    elif zeroes < 12:
        num /= 1_000_000_000
        num = str(int(num)) + " gigaohms"

    return num


def count_zeroes(num):
    count = 0
    index = len(num)
    for d in num[::-1]:
        if d != '0':
            break
        count += 1
        index -= 1
    return count


def first(colors):
    num = str(col.index(colors[0]))
    return "" if num == "0" else num
