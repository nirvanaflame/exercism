import com.sun.jdi.Value;

import java.util.List;

class BinarySearch {

    List<Integer> list;

    public BinarySearch(List<Integer> list) {
        this.list = list;
    }

    public int indexOf(int target) throws ValueNotFoundException {
        int left = 0;
        int right = list.size() - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            Integer value = list.get(mid);

            if (value == target) {
                return mid;
            } else if (value < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        throw new ValueNotFoundException("Value not in array");
    }
}
