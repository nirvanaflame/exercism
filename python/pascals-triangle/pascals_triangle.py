from math import factorial


def rows(row_count: int) -> list[list[int]]:
    if row_count < 0:
        raise ValueError("number of rows is negative")
    if row_count == 0:
        return []
    return rows(row_count - 1) + [[pascals_triangle(row_count - 1, j) for j in range(0, row_count)]]


def pascals_triangle(row: int, column: int) -> int:
    return int(factorial(row) / (factorial(row - column) * factorial(column)))
