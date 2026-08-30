import java.util.Arrays;

class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        return birdsPerDay.length < 1 ? new int[] {0} 
            : Arrays.copyOfRange(birdsPerDay, birdsPerDay.length - 7, birdsPerDay.length);
    }

    public int getToday() {
        return birdsPerDay.length == 0 ? 0 : birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length - 1] = getToday() + 1;
    }

    public boolean hasDayWithoutBirds() {
        return Arrays.stream(birdsPerDay).anyMatch(it -> it == 0);
    }

    public int getCountForFirstDays(int numberOfDays) {
        return (int) Arrays.stream(birdsPerDay).limit(Math.min(numberOfDays, birdsPerDay.length)).sum();
    }

    public int getBusyDays() {
        return (int) Arrays.stream(birdsPerDay).filter(it -> it > 4).count();
    }
}
