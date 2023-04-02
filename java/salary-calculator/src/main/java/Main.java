public class Main {


    public static void main(String[] args) {
        int sad = tribonacci(37);
        System.out.println(sad);
    }

    static int tribonacci(int n) {
        int[] cache = new int[n + 1];
        return memoizedTribonacci(n, cache);
    }

    static int memoizedTribonacci(int n, int[] cache) {
        if (n < 2) return n;
        if (n == 2) return 1;
        if (cache[n] != 0) return cache[n];
        return cache[n] = memoizedTribonacci(n - 1, cache) + memoizedTribonacci(n - 2, cache) + memoizedTribonacci(n - 3, cache);
    }
}

