def rows(n):
    triangle = [[1]]
    if n == 0:
        return triangle
    for i in range(0, n):
        row = [1]
        for j in range(1, i):
            row.append(triangle[i-1][j-1] + triangle[i-1][j])
        row.append(1)
        triangle.append(row)
    return triangle


if __name__ == '__main__':
    print(rows(1))