import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.stream.IntStream;

public class Robot {

    public String name;

    private static final Set<String> mem = new HashSet<>();

    Robot() {
        reset();
    }

    public void reset() {
        this.name = generateUniqueName();
    }

    private static String generateUniqueName() {
        String name = IntStream
                .concat(
                        IntStream.generate(() -> new Random().nextInt('A', 'Z' + 1)).limit(2),
                        IntStream.generate(() -> new Random().nextInt('0', '9' + 1)).limit(3)
                )
                .collect(
                        StringBuilder::new,
                        StringBuilder::appendCodePoint,
                        StringBuilder::append
                )
                .toString();

        if (mem.contains(name)) {
            generateUniqueName();
        }

        mem.add(name);
        return name;
    }

    public String getName() {
        return name;
    }
}
