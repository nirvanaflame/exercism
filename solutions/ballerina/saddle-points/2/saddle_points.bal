public function saddlePoints(int[][] matrix) returns map<int>[] {
    if matrix.length() == 0 {
        return [];
    }
    if matrix[0].length() == 0 {
        return [];
    }

    int index = 0;
    map<int>[] result = [];
    int colSize = matrix.length();
    foreach int i in 0 ..< colSize {
        int rowMax = getRowMax(matrix[i]);

        foreach int j in 0 ..< matrix[i].length() {
            int colMin = getColMin(matrix, j);
            if rowMax <= colMin {
                result[index] = {
                    row: i + 1,
                    column: j + 1
                };
                index += 1;
            }
        }
    }

    return result;
}

function getRowMax(int[] row) returns int {
    var smth = [row[0], ...row];
    return int:max(...smth);
}

function getColMin(int[][] matrix, int colId) returns int {
    return matrix.toStream().'map(row => row[colId])
        .reduce(isolated function(int acc, int x) returns int =>
                int:min(acc, x), int:MAX_VALUE);
}
