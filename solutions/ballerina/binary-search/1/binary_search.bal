# Search an array for a value and return the index.
#
# + array - a sorted array of integers
# + value - the integer item to find
# + return - the index of the value, or nil if the value is not found
public function find(int[] array, int value) returns int? {
    if array.length() == 0 {
        return null;
    }

    int left = 0;
    int right = array.length() - 1;

    while left <= right {
        int mid = left + (right - left) / 2;

        if value == array[mid] {
            return mid;
        } else if value < array[mid] {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return null;
}
