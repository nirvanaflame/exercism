class QueenAttack {

    static canAttack(Queen q1, Queen q2) {
        if (q1.row == q2.row )
            return true;
        if (q1.column == q2.column )
            return true;
        if (Math.abs(q1.row - q2.row) == Math.abs(q1.column - q2.column))
            return true
        return false;
    }
}