public class SalaryCalculator {
    public double finalSalary(int daysSkipped, int productsSold) {
        return Math.min(1000.0 * multiplierPerDaysSkipped(daysSkipped) + bonusForProductSold(productsSold), 2000.0);
    }

    public double multiplierPerDaysSkipped(int daysSkipped) {
        return daysSkipped > 5 ? 0.85 : 1.0;
    }

    public double bonusForProductSold(int productsSold) {
        return (double) multiplierPerProductsSold(productsSold) * productsSold;
    }

    public int multiplierPerProductsSold(int productsSold) {
        return productsSold > 20 ? 13 : 10;
    }
}
