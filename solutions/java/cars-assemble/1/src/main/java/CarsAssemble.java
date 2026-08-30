public class CarsAssemble {

    private static int CARS_PER_HOUR = 221;

    public double productionRatePerHour(int speed) {
        return switch (speed) {
            case 1 -> CARS_PER_HOUR;
            case 2 -> CARS_PER_HOUR * 2;
            case 3 -> CARS_PER_HOUR * 3;
            case 4 -> CARS_PER_HOUR * 4;
            case 5 -> CARS_PER_HOUR * 5 * 90.0 / 100;
            case 6 -> CARS_PER_HOUR * 6 * 90.0 / 100;
            case 7 -> CARS_PER_HOUR * 7 * 90.0 / 100;
            case 8 -> CARS_PER_HOUR * 8 * 90.0 / 100;
            case 9 -> CARS_PER_HOUR * 9 * 80.0 / 100;
            case 10 -> CARS_PER_HOUR * 10 * 77.0 / 100;
            default -> 0.0;
        };
    }

    public int workingItemsPerMinute(int speed) {
        return (int) (productionRatePerHour(speed) / 60);
    }
}
