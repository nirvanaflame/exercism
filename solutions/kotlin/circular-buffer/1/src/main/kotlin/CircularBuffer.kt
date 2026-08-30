import kotlin.collections.ArrayDeque

class EmptyBufferException : RuntimeException()

class BufferFullException : RuntimeException()

class CircularBuffer<T>(val capacity: Int) {
    var buffer: ArrayDeque<T>

    init {
        buffer = ArrayDeque(capacity)
    }

    fun read(): T {
        if (buffer.size == 0) throw EmptyBufferException()
        return buffer.removeFirst()
    }

    fun write(value: T) {
        if (buffer.size == capacity) throw BufferFullException()
        buffer.addLast(value)
    }

    fun overwrite(value: T) {
        if (buffer.size == capacity) read()
        write(value)
    }

    fun clear() {
        buffer = ArrayDeque(capacity)
    }
}