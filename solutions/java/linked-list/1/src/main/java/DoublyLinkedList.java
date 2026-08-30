class DoublyLinkedList<T> {
    private Element<T> head;
    private Element<T> tail;

    void push(T value) {
        initialize(value);
        head = new Element<>(value, head, null);
    }

    T pop() {
        if (head == null) {
            return null;
        }

        var value = head.value;
        head = head.prev;

        if (head == null) {
            tail = null;
        }
        return value;
    }

    void unshift(T value) {
        initialize(value);
        tail = new Element<>(value, null, tail);
    }

    T shift() {
        if (tail == null) {
            return null;
        }

        var value = tail.value;
        tail = tail.next;

        if (tail == null) {
            head = null;
        }

        return value;
    }

    private void initialize(T value) {
        if (head == null) {
            tail = head = new Element<>(value, null, null);
        }
    }

    private static final class Element<T> {
        private final T value;
        private Element<T> prev;
        private Element<T> next;

        Element(T value, Element<T> prev, Element<T> next) {
            this.value = value;
            this.next = next;
            this.prev = prev;
        }
    }
}
