object BinarySearch {
    fun search(list: List<Int>, item: Int): Int {
        if (list.isEmpty()) throw NoSuchElementException()

        var left = 0
        var right = list.size - 1

        while (left <= right) {
            val mid = left + (right - left) / 2

            if (list[mid] == item) {
                return mid
            } else if (list[mid] > item) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        throw NoSuchElementException()
    }
}

