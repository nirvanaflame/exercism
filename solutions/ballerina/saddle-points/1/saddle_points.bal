import ballerina/io;

# Returns the saddle points in the given matrix.
#
# A saddle point is an value that is:
# - equal to the maximum value in its row, and
# - equal to the minimum value in its column.
#
# + matrix - an array of int arrays (i.e. two-dimensional matrix)
# + return - an array of maps [{"row": x, "column": y}, ...]
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

public function main() {
    int[][] matrix = [
        [4, 5, 4],
        [3, 5, 5],
        [1, 5, 4]
    ];
    var sad = saddlePoints(matrix);
    io:println(sad);
}
