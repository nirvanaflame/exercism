import java.util.Objects;

class ResistorColorDuo {
    int value(String[] colors) {
        return Integer.parseInt(
                colorCode(colors[0]) + colorCode(colors[1])
        );
    }


    String[] colors = new String[]{"black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"};

    String colorCode(String color) {
        for (int i = 0; i < colors.length; i++) {
            if (Objects.equals(colors[i], color)) return String.valueOf(i);
        }
        return "" + -1;
    }
}
