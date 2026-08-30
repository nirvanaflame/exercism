# Find the unique multiples of the given factors that are less than the limit.
# Return the sum of the multiples.
#
# + factors - an array of integers
# + 'limit - the upper limit of the multiples
# + return - the sum of the multiples
public function sum(int[] factors, int 'limit) returns int {

    var s = map 
        from int f in factors
        where f > 0
        from int i in int:range(f, 'limit, f)
        select [i.toString(), i]; 

    return int:sum(0, ...s.toArray());
}
