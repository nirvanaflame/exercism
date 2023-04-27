class ArmstrongNumbers {

    boolean isArmstrongNumber(int numberToCheck) {
        String num = String.valueOf(numberToCheck);
        int len = num.length();
        int poweredDigs = num.chars().map(x -> (int) Math.pow(Character.digit(x, 10), len)).sum();
        return numberToCheck == poweredDigs;
    }
}
