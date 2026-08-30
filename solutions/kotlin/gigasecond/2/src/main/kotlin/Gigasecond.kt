import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(localDateTime: LocalDateTime) {
  var date: LocalDateTime = localDateTime.plusSeconds(1_000_000_000)

  constructor(localDate: LocalDate) : this(localDate.atStartOfDay())
}
