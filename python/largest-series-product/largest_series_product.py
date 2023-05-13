import math


def largest_product(series: str, size: int) -> int:
    validate(series, size)

    mem = []

    product = 0
    for ch in series:
        mem.append(int(ch))
        if len(mem) == size:
            product = max(product, math.prod(mem))
            mem.pop(0)

    return product


def validate(series, size):
    if len(series) < size:
        raise ValueError("span must be smaller than string length")
    if size <= 0:
        raise ValueError("span must not be negative")
    if not series.isdigit():
        raise ValueError("digits input must only contain digits")
