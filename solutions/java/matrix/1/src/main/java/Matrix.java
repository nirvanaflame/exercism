import java.util.Arrays;


class Matrix {

    int[][] matrix;
    int rowSize;

    Matrix(String matrixAsString) {
        var rows = matrixAsString.split("\n");
        rowSize = rows.length;
        var colSize = rows[0].split(" ").length;

        matrix = new int[rowSize][colSize];

        int i = 0;
        for (String r : rows) {
            matrix[i++] = Arrays
                    .stream(r.split(" "))
                    .mapToInt(Integer::parseInt).toArray();
        }
    }

    int[] getRow(int rowNumber) {
        return matrix[rowNumber - 1];
    }

    int[] getColumn(int columnNumber) {
        var arr = new int[rowSize];
        int i = 0;
        for (int[] a : matrix) {
            arr[i++] = a[columnNumber - 1];
        }

        return arr;
    }
}
