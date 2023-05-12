
function allocateCubicles(int[] requests) returns int[] {
    map<int> mem = 
        map from int req in requests
        order by req
        select [req.toString(), req];
    return mem.toArray();
}
