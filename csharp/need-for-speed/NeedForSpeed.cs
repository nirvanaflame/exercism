class RemoteControlCar
{
    private int _speed;
    private int _distance;
    
    private int _batteryDrain;
    private int _battery = 100;

    public RemoteControlCar(int speed, int batteryDrain)
    {
        _speed = speed;
        _batteryDrain = batteryDrain;
    }

    public bool BatteryDrained() => _battery - _batteryDrain < 0;

    public int DistanceDriven() => _distance;

    public void Drive()
    {
        if (BatteryDrained()) return;
        _distance += _speed;
        _battery -= _batteryDrain;
    }

    public static RemoteControlCar Nitro() => new(50, 4);
}

class RaceTrack
{
    private int _distance;

    public RaceTrack(int distance)
    {
        _distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (car.DistanceDriven() < _distance && !car.BatteryDrained())
        {
            car.Drive();
        }
        return car.DistanceDriven() >= _distance;
    }
}
