class CollatzCalculator {

    int computeStepCount(int start) {
        if (start < 1) 
            throw new IllegalArgumentException("Only positive integers are allowed");
        return step(start, 0);
    }

    int step(int number, int step) {
        if (number == 1) return step;
        return number % 2 == 0 
            ? step(number / 2, step + 1)
            : step(3 * number + 1, step + 1);
    }
}
