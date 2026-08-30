class Acronym {

    static String abbreviate(String phrase) {
        phrase = phrase.replaceAll("[-_]", " ")
                       .split("\\s+")
                       .collect { it[0].toUpperCase() }
                       .join("")
        return phrase
    }

}