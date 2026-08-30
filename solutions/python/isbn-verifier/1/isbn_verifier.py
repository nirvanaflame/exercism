def is_valid(isbn):

    if len(isbn) not in (10, 13):
        return False

    multi = 10
    sum = 0
    for x in isbn:
        if x.isnumeric():
            sum += int(x) * multi
            multi -= 1
        elif x == 'X':
            if multi != 1:
                return False
            sum += 10
        elif x != '-':
            return False

    sum_ = sum % 11 == 0
    return sum_
