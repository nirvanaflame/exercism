class Deque<T> {

    var head: Node<T>? = null
    var tail: Node<T>? = null

    fun push(value: T) {
        val newNode = Node(value)
        if (head == null) {
            head = newNode
            tail = head
        } else {
            head!!.next = newNode
            newNode.prev = head
            head = newNode

        }
    }

    fun pop(): T? {
        if (head == null) {
            return null
        }

        val value = head!!.value
        head  = head!!.prev

        if (head == null) {
            tail = null
        }

        return value
    }

    fun unshift(value: T) {
        val newNode = Node(value)
        if (tail == null) {
            tail = newNode
            head = tail
        } else {
            tail!!.prev = newNode
            newNode.next = tail
            tail = newNode
        }
    }

    fun shift(): T? {
        if (tail == null) {
            return null
        }
        val value = tail!!.value
        tail = tail!!.next

        if (tail == null) {
            head = null
        }

        return value
    }

    class Node<T>(val value: T) {
        var next: Node<T>? = null
        var prev: Node<T>? = null
    }
}
