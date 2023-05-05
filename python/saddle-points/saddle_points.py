def saddle_points(matrix: [[]]) -> []:
    if any(len(matrix[0]) != len(row) for row in matrix):
        raise ValueError("irregular matrix")

    row_max = list(map(max, matrix))
    column_min = list(map(min, list(zip(*matrix))))

    return [
        {'row': r+1, 'column': c+1}
        for r, r_max in enumerate(row_max)
        for c, c_min in enumerate(column_min)
        if r_max == c_min
    ]
