import java.time.Duration;
import java.time.Instant;
import java.util.HashMap;

public class RateLimiter<K> {
    private final HashMap<K, Window> windows = new HashMap<>();

    private final int limit;
    private final Duration windowSize;
    private final TimeSource timeSource;

    public RateLimiter(int limit, Duration windowSize, TimeSource timeSource) {
        this.limit = limit;
        this.windowSize = windowSize;
        this.timeSource = timeSource;
    }

    public boolean allow(K clientId) {
        var now = timeSource.now();
        var window = windows.get(clientId);

        if (window == null || !now.isBefore(window.start().plus(windowSize))) {
            windows.put(clientId, new Window(now, 1));
            return true;
        }

        if (window.count < limit) {
            windows.put(clientId, new Window(window.start(), window.count() + 1));
            return true;
        }

        return false;
    }


    private record Window(Instant start, int count) {
    }
}
