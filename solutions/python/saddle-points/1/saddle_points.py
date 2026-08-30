def saddle_points(matrix):
    columns_number = len(matrix)
    if columns_number == 0:
        return []
    if irregular_matrix(matrix):
        raise ValueError("irregular matrix")

    points = []
    for i in range(0, columns_number):
        for j in range(0, len(matrix[i])):
            col_min = column_min(matrix, j)
            if max(matrix[i]) <= col_min:
                points.append({
                    "row": i + 1,
                    "column": j + 1
                })

    return points


def irregular_matrix(matrix: []) -> bool:
    length = len(matrix[0])
    for row in matrix:
        if len(row) != length:
            return True
    return False


def column_min(matrix: [], column_id: int) -> int:
    min_value = matrix[0][column_id]
    for row in matrix:
        min_value = min(row[column_id], min_value)
    return min_value
