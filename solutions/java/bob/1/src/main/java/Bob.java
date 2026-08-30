class Bob {

    public String hey(String say) {
        var s = say.trim();

        if (s.isBlank()) {
            return "Fine. Be that way!";
        }

        boolean isQuestion = s.endsWith("?");
        boolean isYell = s.toUpperCase().equals(s)
                && s.chars().filter(Character::isLetter)
                .findAny()
                .isPresent();

        if (isYell && isQuestion) {
            return "Calm down, I know what I'm doing!";
        } else if (isQuestion) {
            return "Sure.";
        } else if (isYell) {
            return "Whoa, chill out!";
        } else {
            return "Whatever.";
        }
    }
}