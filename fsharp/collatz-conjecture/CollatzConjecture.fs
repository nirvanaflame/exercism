module CollatzConjecture

let steps (number: int): int option = 
    let mutable x = number
    let mutable count = 0
    while x <> 1 do
        printfn "%d" x
        if x % 2 = 0 then
            x <- x / 2
        elif x % 2 = 1 then
            x <- 3 * x + 1
        count <- count + 1    
    Some(count)
    