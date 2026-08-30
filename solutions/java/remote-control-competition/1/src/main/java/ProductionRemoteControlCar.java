class ProductionRemoteControlCar implements RemoteControlCar, Comparable<ProductionRemoteControlCar> {

    int distance;
    int victor;
    
    public void drive() {
        distance += 10;
    }

    public int getDistanceTravelled() {
        return distance;
    }

    public int getNumberOfVictories() {
        return victor;
    }

    public void setNumberOfVictories(int numberOfVictories) {
        victor = numberOfVictories;
    }

    @Override
    public int compareTo(ProductionRemoteControlCar car) {
        return getNumberOfVictories() - car.getNumberOfVictories();
    }
}
