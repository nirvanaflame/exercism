public class Lasagna {

    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int m) {
        return expectedMinutesInOven() - m;
    }

    public int preparationTimeInMinutes(int l) {
        return l * 2;
    }

    public int totalTimeInMinutes(int l, int m) {
        return preparationTimeInMinutes(l) + m;
    }
}
