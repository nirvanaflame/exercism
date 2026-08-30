class LinkedList {
    LinkedList? prev;
    LinkedList? next;
    int? value;

    public function init(int? value = null, LinkedList? head = null, LinkedList? tail = null) {
        self.value = value;
        self.prev = head;
        self.next = tail;
    }
};

LinkedList? head = null;
LinkedList? tail = null;

public function newLinkedList() returns LinkedList {
    return new LinkedList();
}

# Adds a new value to the tail of a linked list
#
# + list - the linked list
# + value - integer value to add
public function push(LinkedList list, int value) {
    if list.value == null {
        list.value = value;
        head = list;
        tail = list;
    } else {
        var node = new LinkedList(value, tail, null);
        list.next = node;
    }
}

# Adds a new value to the head of a linked list
#
# + list - the linked list
# + value - integer value to add
public function unshift(LinkedList list, int value) {
    var node = new LinkedList(value, null, list.prev);
    list.prev = node;
}

# Remove a value from the tail of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function pop(LinkedList list) returns int? {
    var node = list.next;
    if node != null {
        list.next = null;
        return node.value;
    } else {
        // int val = list.value;
        list.value = 0;
        return 0;
    }
}

# Remove a value from the head of a linked list
#
# + list - the linked list
# + return - the value, or nil if the list is empty
public function shift(LinkedList list) returns int? {
    var local = list;
    var node = list.prev;
    if node != null {
        local.prev = node.next;
        return node.value;
    } else {
        // int val = local.value;
        var next = local.next;
        if next != null {
            next.prev = null;
            local = next;
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
    while list.next != null {
        count += 1;
    }
    return count;
}

# Delete the given value from the linked list
#
# + list - the linked list
# + value - integer value to delete
public function delete(LinkedList list, int value) {
    while list.next != null {
        if list.value == value {
            var prev = list.prev;
            var next = list.next;
            if prev != null {
                prev.next = next;
            }
            if next != null {
                next.prev = prev;
            }
        }
    }
}
