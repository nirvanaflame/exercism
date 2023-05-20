import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class BeerSong {

    public String verse(int beers) {
        return switch (beers) {
            default -> """
                    %d bottles of beer on the wall, %d bottles of beer.
                    Take one down and pass it around, %d bottles of beer on the wall.\n
                    """.formatted(beers, beers, beers - 1);
            case 2 -> """
                    2 bottles of beer on the wall, 2 bottles of beer.
                    Take one down and pass it around, 1 bottle of beer on the wall.\n
                    """;
            case 1 -> """
                    1 bottle of beer on the wall, 1 bottle of beer.
                    Take it down and pass it around, no more bottles of beer on the wall.\n
                    """;
            case 0 -> """
                    No more bottles of beer on the wall, no more bottles of beer.
                    Go to the store and buy some more, 99 bottles of beer on the wall.\n
                    """;
        };
    }

    public String sing(int start, int limit) {
        return IntStream.range(0, limit)
                .mapToObj(x -> verse(start-x))
                .collect(Collectors.joining());
    }

    public String singSong() {
        return sing(99, 100);
    }
}