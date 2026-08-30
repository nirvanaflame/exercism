object HandshakeCalculator {
    fun calculateHandshake(number: Int): List<Signal> {
        val signals = number.toString(2)
            .reversed()
            .take(4)
            .mapIndexedNotNull { i, digit -> Signal.entries[i].takeIf { digit == '1' } }

        return if (number >= 0b10000) signals.reversed() else signals;
    }
}
