import math

def score(x, y):
    pointRadius = math.sqrt(x*x + y*y)
    if pointRadius <= 1.0:
        return 10
    elif pointRadius <= 5.0:
        return 5
    elif pointRadius <= 10.0:
        return 1
    else:
        return 0
    
