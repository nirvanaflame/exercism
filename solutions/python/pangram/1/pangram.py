
alpha = "abcdefghijklmnopqrstuvwxyz"

def is_pangram(sentence):
    arr = [0] * 26
    for c in list(sentence.lower()):
        if c.isalpha():
            index = alpha.index(c)
            arr[index] += 1
    return 0 not in arr
