def square_root(number):
    guess = number / 2
    threshold = 0.000000000000001
    while abs(guess * guess - number) > threshold:
        guess = (guess + number / guess) / 2

    return guess
