class RunLengthEncoding {

    static encode(input) {
        input.replaceAll('(.)\\1+') {
            "${it[0].length()}${it[1]}"
        }
    }

    static decode(input) {
        input.replaceAll('(\\d+)(.)') {
            it[2] * (it[1] as int)
        }
    }
}