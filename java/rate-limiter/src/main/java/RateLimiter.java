import java.time.Duration;
import java.time.Instant;
import java.util.HashMap;

public class RateLimiter<K> {

    private final int limit;
    private final Duration windowSize;
    private final TimeSource timeSource;
    private final HashMap<K, ClientState> states;

    public RateLimiter(int limit, Duration windowSize, TimeSource timeSource) {
        this.limit = limit;
        this.windowSize = windowSize;
        this.timeSource = timeSource;
        this.states = new HashMap<>();
    }

    public boolean allow(K clientId) {
        var now = timeSource.now();
        var state = states.get(clientId);

        if (state == null) {
            states.put(clientId, new ClientState(now, 1));
            return true;
        }

        var windowEnd = state.start.plus(windowSize);

        if (!now.isBefore(windowEnd)) {
            state.start = now;
            state.count = 1;
            return true;
        }

        if (state.count < limit) {
            state.count++;
            return true;
        }

        return false;
    }

    private static class ClientState {

        private Instant start;
        private long count;

        public ClientState(Instant start, long count) {
            this.start = start;
            this.count = count;
        }
    }
}
