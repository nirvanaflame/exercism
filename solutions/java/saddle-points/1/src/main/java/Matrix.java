import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Matrix {

    private final List<List<Integer>> matrix;

    Matrix(List<List<Integer>> matrix) {
        this.matrix = matrix;
    }

    Set<MatrixCoordinate> getSaddlePoints() {
        Set<MatrixCoordinate> saddlePoints = new HashSet<>();
        if (matrix.isEmpty()) {
            return saddlePoints;
        }

        int columnSize = matrix.size();
        for (int i = 0; i < columnSize; i++) {
            int rowMax = getRowMax(i);

            for (int j = 0; j < matrix.get(i).size(); j++) {
                int columnMin = getColumnMin(j);
                if (rowMax <= columnMin) {
                    saddlePoints.add(new MatrixCoordinate(i + 1, j + 1));
                }
            }
        }

        return saddlePoints;
    }

    private int getRowMax(int rowId) {
        return Collections.max(matrix.get(rowId));
    }

    private int getColumnMin(int columnId) {
        return matrix.stream()
                .map(row -> row.get(columnId))
                .min(Integer::compareTo)
                .orElseThrow(() -> new IllegalArgumentException("Column cannot be empty"));
    }
}
