def is_armstrong_number(number):
    arr = str(number)
    size = len(arr)
    l = [pow(int(x), size) for x in arr]

    return number == sum(l)
    
