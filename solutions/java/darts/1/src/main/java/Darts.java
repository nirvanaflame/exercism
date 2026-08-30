class Darts {
    int score(int xDart, int yDart) {
        int x = Math.abs(xDart);
        int y = Math.abs(yDart);
        if (x <= 1 && y <= 1) return 10;
        if (x <= 3.5 && y <= 3.5) return 5;
        if (x <= 7 && y <= 7) return 1;
        return 0;
    }

    int score(double xDart, double yDart) {
        double x = Math.abs(xDart);
        double y = Math.abs(yDart);
        if (x <= 1 && y <= 1) return 10;
        if (x <= 3.5 && y <= 3.5) return 5;
        if (x <= 7 && y <= 7) return 1;
        
        return 0;
    }
}
