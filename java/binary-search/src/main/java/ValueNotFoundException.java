class ValueNotFoundException extends Exception {

    ValueNotFoundException() {
        this("Value not in array");
    }

    ValueNotFoundException(String message) {
        super(message);
    }
}
