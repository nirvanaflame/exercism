import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond {
  var date: Any

  constructor(localDateTime: LocalDateTime) {
    date = localDateTime.plusSeconds(1_000_000_000)
  }

  constructor(localDate: LocalDate) {
    val of = LocalDateTime.of(localDate.year, localDate.month, localDate.dayOfMonth, 0, 0)
    date = of.plusSeconds(1_000_000_000)
  }
}
