def is_isogram(str):
    if len(str) == 0:
        return True
    low = str.lower()
    for x in low:
        if x.isalpha() and low.count(x) > 1:
            return False
    return True
    
    # return len(str) == 0 or (True if str.count(x) < 2 else False for x in str if x.isalpha())
