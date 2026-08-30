class Accumulate {

    static accumulate(Collection collection, Closure func) {
       collection.collect { func it }
    }

}