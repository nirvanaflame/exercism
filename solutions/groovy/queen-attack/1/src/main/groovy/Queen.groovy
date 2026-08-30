class Queen {

    int row
    int column
    Queen(int row, int column) {
        if ((row < 0) || (row > 7)) {
            throw new Exception("Invalid row ${row}, row must be between 0 and 7")
        }
        if ((column < 0) || (column > 7)) {
            throw new Exception("Invalid column ${column}, column must be between 0 and 7")
        }
        this.row = row
        this.column = column
    }
}