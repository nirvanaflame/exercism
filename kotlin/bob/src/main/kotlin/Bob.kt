object Bob {
    fun hey(input: String): String {
        val say: String = input.trim()
        if (say.isBlank()) return "Fine. Be that way!"

        val isQuestion: Boolean = say.endsWith("?")
        val isYell: Boolean = say.uppercase() == say && say.any { c: Char -> c in 'A'..'Z' }

        return when (Pair(isQuestion, isYell)) {
            Pair(true, true) -> "Calm down, I know what I'm doing!"
            Pair(true, false) -> "Sure."
            Pair(false, true) -> "Whoa, chill out!"
            else -> "Whatever."
        }
    }
}
