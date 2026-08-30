class ResistorColorTrio {
    static String label(String[] colors) {
        int firstOrdinal = getOrdinal(colors[0]);
        int secondOrdinal = getOrdinal(colors[1]);
        int thirdOrdinal = getOrdinal(colors[2]);
        int countZeroes = secondOrdinal == 0 ? thirdOrdinal + 1 : thirdOrdinal;
        
        return "%s%s%s".formatted(
                getPrefix(firstOrdinal),
                getPrefix(secondOrdinal),
                getSuffix(countZeroes)
        );
    }

    static int getOrdinal(String color) {
        return Colors.valueOf(color.toUpperCase()).ordinal();
    }

    static String getPrefix(int digit) {
        return digit == 0 ? "" : "" + digit;
    }

    static String getSuffix(int ordinal) {
        return switch (ordinal) {
            case 0, 1, 2 -> "0".repeat(ordinal) + " ohms";
            case 3, 4, 5 -> "0".repeat(ordinal - 3) + " kiloohms";
            case 6, 7, 8 -> "0".repeat(ordinal - 6) + " megaohms";
            case 9 -> " gigaohms";
            default -> throw new IllegalStateException("Unexpected value: " + ordinal);
        };
    }
}

enum Colors {
    BLACK,
    BROWN,
    RED,
    ORANGE,
    YELLOW,
    GREEN,
    BLUE,
    VIOLET,
    GREY,
    WHITE
}
