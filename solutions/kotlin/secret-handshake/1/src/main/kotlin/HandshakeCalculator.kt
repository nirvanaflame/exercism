object HandshakeCalculator {
    fun calculateHandshake(number: Int): List<Signal> {
        var signals = arrayListOf<Signal>()

        val str = number.toString(2)
        val last = str.length - 1
        var index = 0
        for (i in last downTo 0) {
            if (index == 5) break
            if (index == 4 && str[i] == '1')  {
                return signals.reversed()
            }
            if (str[i] == '1') {
                signals.add(Signal.entries[index])
            }
            index++
        }

        return signals;
    }
}
