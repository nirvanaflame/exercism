import java.time.Duration;
import java.util.ArrayDeque;
import java.util.HashMap;

public class RateLimiter<K> {

    private final HashMap<K, ArrayDeque<TimeSource>> buckets = new HashMap<>();

    private final int limit;
    private final Duration windowSize;
    private final TimeSource timeSource;

    public RateLimiter(int limit, Duration windowSize, TimeSource timeSource) {
        this.limit = limit;
        this.windowSize = windowSize;
        this.timeSource = timeSource;
    }

    public boolean allow(K clientId) {
        var bucket = buckets.get(clientId);
        if (bucket == null) {
            var b = new ArrayDeque<TimeSource>();
            b.addLast(now());
            buckets.put(clientId, b);
            return true;
        }

        if (bucket.size() < limit) {
            bucket.addLast(now());
            return true;
        }

        var first = bucket.pollFirst();

        var now = timeSource.now();
        if (now.isAfter(first.now()) || now.equals(first.now())) {
            bucket.addLast(now());
            return true;
        }
        bucket.addFirst(first);

        return false;
    }

    private TimeSource now() {
        var ts = new TimeSource(timeSource.now());
        ts.advance(windowSize);
        return ts;
    }
}
