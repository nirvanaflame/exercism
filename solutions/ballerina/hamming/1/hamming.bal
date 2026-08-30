public function distance(string strand1, string strand2) returns int|error {
    if strand1.length() != strand2.length() {
        return error("Unequal strand lengths");
    }

    int count = 0;
    foreach int i in int:range(0, strand1.length(), 1) {
        if strand1[i] != strand2[i] {count+=1;}
    }

    return count;
}
