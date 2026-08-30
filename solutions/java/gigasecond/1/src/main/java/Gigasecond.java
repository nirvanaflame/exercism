import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Gigasecond {
    private LocalDateTime init;

    public Gigasecond(LocalDate moment) {
        init = LocalDateTime.of(moment, LocalTime.MIDNIGHT);
    }

    public Gigasecond(LocalDateTime moment) {
        init = moment;
    }

    public LocalDateTime getDateTime() {
        return init.plusSeconds(1_000_000_000);
    }    
}
