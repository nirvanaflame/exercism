import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.stream.IntStream;

public class Robot {

    public String name;

    public static final Set<String> mem = new HashSet<>();
    private static final Random random = new Random();

    Robot() {
        reset();
    }

    public void reset() {
        mem.remove(this.name);
        this.name = generateUniqueName();
    }


    private String generateUniqueName() {
        while (mem.contains(name = generateName())) {}

        mem.add(name);
        return name;
    }

    private static String generateName() {
        return IntStream
                .concat(
                        IntStream.generate(() -> random.nextInt('A', 'Z' + 1)).limit(2),
                        IntStream.generate(() -> random.nextInt('0', '9' + 1)).limit(3)
                )
                .collect(
                        StringBuilder::new,
                        StringBuilder::appendCodePoint,
                        StringBuilder::append
                )
                .toString();
    }

    public String getName() {
        return name;
    }
}
