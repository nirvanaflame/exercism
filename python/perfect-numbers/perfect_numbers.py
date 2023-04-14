def classify(number):
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    elif number == 1:
        return 'deficient'

    divisor_sum = sum([x for x in range(2, number) if number % x == 0]) + 1
    if number == divisor_sum:
        return 'perfect'
    if number > divisor_sum:
        return 'deficient'
    else:
        return 'abundant'
