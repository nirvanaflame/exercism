class Acronym {

    String phrase;

    Acronym(String phrase) {
        this.phrase = phrase;
    }

    String get() {
        StringBuilder sb = new StringBuilder();
        String replace = phrase.replaceAll("[^a-zA-Z']+", " ");
        String[] split = replace.split(" ");
        for (String w : split) {
            sb.append(w.charAt(0));
        }

        return sb.toString().toUpperCase();
    }
}
