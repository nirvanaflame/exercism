class Darts {

    int score(double xDart, double yDart) {
        double position = Math.abs(Math.sqrt(Math.pow(xDart, 2) + Math.pow(yDart, 2)));

        if (position <= 1) return 10;
        if (position <= 5) return 5;
        if (position <= 10) return 1;


        return 0;
    }
}
