public class ElonsToyCar {

    int distance;
    int battery;

    ElonsToyCar() {
        this.distance = 0;
        this.battery = 100;
    }

    public static ElonsToyCar buy() {
        return new ElonsToyCar();
    }

    public String distanceDisplay() {
        return String.format("Driven %d meters", distance);
    }

    public String batteryDisplay() {
        return battery == 0 ? "Battery empty"
                : String.format("Battery at %d%%", battery);
    }

    public void drive() {
        if (battery != 0) {
            distance += 20;
            battery--;
        }
    }
}
