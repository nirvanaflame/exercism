public type Item record {
    int weight;
    int value;
};

public function maximumValue(Item[] items, int maximum_weight) returns int {
    if items.length() == 0 {
        return 0;
    }

    return solve(maximum_weight, items, items.length());
}


function solve(int max_weight, Item[] items, int n) returns int {
    if max_weight == 0 || n == 0 {
        return 0;
    }
    if items[n-1].weight > max_weight {
        return solve(max_weight, items, n-1);
    } else {
        return int:max(
            items[n-1].value + solve(max_weight - items[n-1].weight, items, n-1),
            solve(items[n-1].weight, items, n-1)
        );
    }
}
