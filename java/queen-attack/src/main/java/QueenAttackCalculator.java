public class QueenAttackCalculator {

    Queen white;
    Queen black;

    public QueenAttackCalculator(Queen white, Queen black) {
        if (white == null || black == null)
            throw new IllegalArgumentException("You must supply valid positions for both Queens.");
        if (white.equals(black)) throw new IllegalArgumentException("Queens cannot occupy the same position.");

        this.white = white;
        this.black = black;
    }

    public boolean canQueensAttackOneAnother() {
        return white.x() == black.x() || white.y() == black.y()
                || (Math.abs(white.x() - black.x()) == Math.abs(white.y() - black.y()));
    }
}

record Queen(int x, int y) {
    Queen {
        if (x < 0) throw new IllegalArgumentException("Queen position must have positive row.");
        if (y < 0) throw new IllegalArgumentException("Queen position must have positive column.");
        if (x > 7) throw new IllegalArgumentException("Queen position must have row <= 7.");
        if (y > 7) throw new IllegalArgumentException("Queen position must have column <= 7.");
    }
}
