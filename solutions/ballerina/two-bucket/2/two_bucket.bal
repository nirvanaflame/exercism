public function measure(int bucketOne, int bucketTwo, int goal, string startBucket) returns TwoBucketSolution|error {
    [Bucket, Bucket] [small, big] = createBuckets(bucketOne, bucketTwo);
    [Bucket, Bucket] [goalBucket, otherBucket] = (small.name == startBucket && small.size >= goal) ? [small, big] : [big, small];
    
    Bucket strtBucket = small.name == startBucket ? small : big;
    strtBucket.fill();
    int moves = 1;
    
    if goalBucket.size == goal {
        if goalBucket.isFull() {
            return {
                moves: moves,
                goalBucket: goalBucket.name,
                otherBucket: 0
            };
        } else {
            return {
                moves: moves + 1,
                goalBucket: goalBucket.name,
                otherBucket: otherBucket.amount()
            };
        }
       
    } 
    while !(goalBucket.reachTarget(goal)) {
        
        if goalBucket.size == goal {
            goalBucket.fill();
        } else if big.isFull() {
            big.empty();
        } else if small.isEmpty() {
            small.fill();
        } else {
            small.remove(big.add(small.amount()));
        }
        moves += 1;
       
        if moves == 20 {
            return error("goal is impossible");
        }
    }

    int otherBucketVal = startBucket == goalBucket.name ? otherBucket.size : 0;

    return {
        moves: moves,
        goalBucket: goalBucket.name,
        otherBucket: otherBucketVal
    };
}

public function createBuckets(int bucketOne, int bucketTwo) returns [Bucket, Bucket] {
    return bucketOne < bucketTwo 
        ? [new Bucket("one", bucketOne), new Bucket("two", bucketTwo)]
        : [new Bucket("one", bucketTwo), new Bucket("two", bucketOne)];
}

public class Bucket {
    final string name;
    final int size;
    private int available;
    private int filled;

    public function init(string name, int size) {
        self.name = name;
        self.size = size;
        self.available = size;
        self.filled = 0;
    }

    public function toString() returns string {
        return {
            name: self.name,
            size: self.size,
            available: self.available,
            filled: self.filled
        }.toJsonString();
    }

    public function isFull() returns boolean {
        return self.available == 0;
    }

    public function isEmpty() returns boolean {
        return self.filled == 0;
    }

    public function fill() {
        self.available = 0;
        self.filled = self.size;
    }

    public function empty() {
        self.available = self.size;
        self.filled = 0;
    }

    public function amount() returns int {
        return self.filled;
    }

    public function add(int amount) returns int {
        int temp = self.filled;
        self.filled = int:min(self.filled + amount, self.size);
        self.available = self.size - self.filled;
        return self.filled - temp;
    }

    public function remove(int amount) {
        self.filled -= amount;
        self.available += amount;
    }

    public function reachTarget(int goal) returns boolean {
        return self.filled == goal;
    }
};