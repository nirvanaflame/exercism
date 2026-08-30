class NeedForSpeed {

    int speed;
    int distance;
    int battery;
    int batteryDrain;

    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.distance = 0;
        this.battery = 100;
        this.batteryDrain = batteryDrain;
    }

    public boolean batteryDrained() {
        return battery <= 0;
    }

    public int distanceDriven() {
        return distance;
    }

    public void drive() {
        if (batteryDrained()) return;
        distance += speed;
        battery -= batteryDrain;
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {

    int distance;

    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean tryFinishTrack(NeedForSpeed car) {
        return car.distanceDriven() >= distance
                || (car.battery / car.batteryDrain * car.speed + car.distance) >= distance;
    }
}
