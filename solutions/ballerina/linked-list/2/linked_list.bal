public class LinkedList {
    Node? head;
    Node? tail;
    int length;

    public function init(int? value = null, Node? head = null, Node? tail = null) {
        self.head = head;
        self.tail = tail;
        self.length = 0;
    }
};

class Node {
    Node? next;
    Node? prev;
    int? value;

    public function init(Node? prev = null, int? value = null, Node? next = null) {
        self.prev = prev;
        self.value = value;
        self.next = next;
    }
}

public function newLinkedList() returns LinkedList {
    return new LinkedList();
}

# Adds a new value to the tail of a linked list
#
# + list - the linked list
# + value - integer value to add
public function push(LinkedList list, int value) {
    var node = new Node(value = value);
    var t = list.tail;
    if t == null {
        list.head = node;
        list.tail = node;
    } else {
        t.next = node;
        node.prev = t;
        list.tail = node;
    }

    list.length += 1;
}

# Adds a new value to the head of a linked list
#
# + list - the linked list
# + value - integer value to add
public function unshift(LinkedList list, int value) {
    var node = new Node(value = value);
    var h = list.head;
    if h == null {
        list.head = node;
        list.tail = node;
    } else {
        h.prev = node;
        node.next = h;
        list.head = node;
    }
    list.length += 1;
}

# Remove a value from the tail of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function pop(LinkedList list) returns int? {
    var node = list.tail;
    if node == null {
        return null;
    }
    if node.prev == null {
        list.head = null;
    }
    list.tail = node.prev;
    var t = list.tail;
    if t != null {
        t.next = null;
    }
    list.length -= 1;
    return node.value;
 
}

# Remove a value from the head of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function shift(LinkedList list) returns int? {
    var node = list.head;
    if node == null {
        return null;
    }
    if node.next == null {
        list.tail = null;
    }
    list.head = node.next;
    var h = list.head;
    if h != null {
        h.prev = null;
    }
    list.length -= 1;
    return node.value;
}

# Count the number of values in a list
#
# + list - the linked list
# + return - the number of values, or zero for an empty list
public function count(LinkedList list) returns int {
    return list.length;
}

# Delete the given value from the linked list
#
# + list - the linked list
# + value - integer value to delete
public function delete(LinkedList list, int value) {
    var node = list.head;
    while node != null {
        if node.value == value {
            var prev = node.prev;
            var next = node.next;
            if prev != null {
                prev.next = next;
            } else {
                list.head = next;
            }
            if next != null {
                next.prev = prev;
            } else {
                list.tail = prev;
            }
            list.length -= 1;
            return;
        }
        node = node.next;
    }
}
