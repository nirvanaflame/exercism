class DoublyLinkedList<T> {
    private Node head;
    private Node tail;

    void push(T value) {
        var newNode = new Node(value);

        if (head == null) {
            tail = head = newNode;
        } else {
            head.next = newNode;
            newNode.prev = head;
            head = newNode;
        }
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
        var newNode = new Node(value);

        if (tail == null) {
            tail = head = newNode;
        } else {
            tail.prev = newNode;
            newNode.next = tail;
            tail = newNode;
        }
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

    private class Node {
        private final T value;
        private Node prev;
        private Node next;

        Node(T value) {
            this.value = value;
        }
    }
}
