import java.util.ArrayList;
import java.util.List;

public class MinesweeperBoard {

    List<String> inputBoard;
    String[][] matrix;
    int length;
    int width;

    public MinesweeperBoard(List<String> inputBoard) {
        this.inputBoard = inputBoard;
        this.matrix = inputBoard
                .stream()
                .peek(row -> this.width = row.length())
                .map(row -> row.split(""))
                .toArray(String[][]::new);
        this.length = inputBoard.size();
    }


    public List<String> withNumbers() {
        if (inputBoard.isEmpty()
                || inputBoard.stream().allMatch(String::isBlank)
                || inputBoard.stream().allMatch(row -> row.matches("\\*+"))) {
            return inputBoard;
        }

        ArrayList<String> rows = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            StringBuilder row = new StringBuilder();
            for (int j = 0; j < width; j++) {
                int counted = scanMatrix(i, j);
                Object toAppend = counted == 0 ? " " : counted;
                row.append(matrix[i][j].equals("*") ? "*" : toAppend);
            }
            rows.add(row.toString());

        }
        return rows;
    }

    private int scanMatrix(int i, int j) {
        int counter = 0;

        if (0 <= j - 1) counter += check(i, j - 1);
        if (j + 1 < width) counter += check(i, j + 1);
        if (0 <= i - 1) counter += check(i - 1, j);
        if (i + 1 < length) counter += check(i + 1, j);

        if (0 <= i - 1 && 0 <= j - 1) counter += check(i - 1, j - 1);
        if (i + 1 < length && j + 1 < width) counter += check(i + 1, j + 1);
        if (i + 1 < length && 0 <= j - 1) counter += check(i + 1, j - 1);
        if (0 <= i - 1 && j + 1 < width) counter += check(i - 1, j + 1);

        return counter;
    }

    private int check(int i, int j) {
        return matrix[i][j].contains("*") ? 1 : 0;
    }
}