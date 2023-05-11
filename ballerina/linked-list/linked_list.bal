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
    var node = new Node(list.tail, value = value);
    if list.tail == null {
        list.head = node;
        list.tail = node;
    } else {
        var t = list.tail;
        if t != null {
            t.next = node;
        }
        list.tail = node;
        node.prev = t;
    }

    list.length += 1;
}

# Adds a new value to the head of a linked list
#
# + list - the linked list
# + value - integer value to add
public function unshift(LinkedList list, int value) {

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
    list.length -= 1;
    node.prev = null;
    return node.value;
 
}

# Remove a value from the head of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function shift(LinkedList list) returns int? {
    var local = list;
    var node = list.head;
    if node != null {
        local.head = node.next;
        return node.value;
    } else {
        // int val = local.value;
        var next = local.tail;
        if next != null {
            next.prev = null;
            // local = next;
        }
        return 0;
    }
}

# Count the number of values in a list
#
# + list - the linked list
# + return - the number of values, or zero for an empty list
public function count(LinkedList list) returns int {
    int count = 0;
    while list.tail != null {
        count += 1;
    }
    return count;
}

# Delete the given value from the linked list
#
# + list - the linked list
# + value - integer value to delete
public function delete(LinkedList list, int value) {
    while list.tail != null {
        // if list.value == value {
        //     var prev = list.head;
        //     var next = list.tail;
        //     if prev != null {
        //         prev.next = next;
        //     }
        //     if next != null {
        //         next.prev = prev;
        //     }
        // }
    }
}
