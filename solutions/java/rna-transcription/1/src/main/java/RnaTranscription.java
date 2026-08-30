class RnaTranscription {

    String transcribe(String dnaStrand) {
        return dnaStrand.isEmpty()
                ? dnaStrand
                : dnaStrand.chars().map(x -> convert(x))
                        .collect(StringBuilder::new,
                                 StringBuilder::appendCodePoint,
                                 StringBuilder::append)
                        .toString();
    }

    private int convert(int dna) {
        return switch (dna) {
            case 'C' -> 'G';
            case 'G' -> 'C';
            case 'T' -> 'A';
            case 'A' -> 'U';
            default -> 0;
        };
    }
}
