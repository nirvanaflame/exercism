import java.util.Arrays;

class Yacht {
    private int[] dice;
    private YachtCategory yachtCategory;
    Yacht(int[] dice, YachtCategory yachtCategory) {
        this.dice = dice;
        this.yachtCategory = yachtCategory;
    }

    int score() {
        Arrays.sort(dice);
        return switch (yachtCategory) {
            case ONES, TWOS, THREES, FOURS, FIVES, SIXES -> calculateSum(yachtCategory);
            case YACHT -> isYacht() ? 50 : 0;
            case CHOICE -> calculateChoice();
            case FULL_HOUSE -> isFullHouse() ? calculateChoice() : 0;
            case BIG_STRAIGHT -> isBigStraight() ? 30 : 0;
            case LITTLE_STRAIGHT -> isLittleStraight() ? 30 : 0;
            case FOUR_OF_A_KIND -> isFourOfAKind() ? calculateFourOfAKindSum() : 0;
        };
    }

    private int calculateSum(YachtCategory category) {
        int target = category.ordinal();
        return Arrays.stream(dice).filter(num -> num == target).sum();
    }

    private boolean isYacht() {
        return Arrays.stream(dice).distinct().count() == 1;
    }

    private int calculateChoice() {
        return Arrays.stream(dice).sum();
    }

    private boolean isFullHouse() {
        return !isYacht() && ((dice[0] == dice[2] && dice[3] == dice[4]) || (dice[0] == dice[1] && dice[2] == dice[4]));
    }

    private boolean isBigStraight() {
        return Arrays.equals(dice, new int[]{2, 3, 4, 5, 6});
    }
    
    private boolean isLittleStraight() {
        return Arrays.equals(dice, new int[]{1, 2, 3, 4, 5});
    }

    private boolean isFourOfAKind() {
        return dice[0] == dice[3] || dice[1] == dice[4];
    }
    
    private int calculateFourOfAKindSum() {
        return Arrays.stream(dice).sum() - (isFourOfAKind() ? dice[0] : dice[4]);
    }
}
