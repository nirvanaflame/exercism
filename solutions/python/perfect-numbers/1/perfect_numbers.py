def classify(number):
    divisor_sum = sum([x for x in range(2, number) if number % x == 0]) + 1
    if number == divisor_sum:
        return 'perfect'
    if number > divisor_sum:
        return 'abundant'
    else:
        return 'deficient'
