lower = 'abcdefghijklmnopqrstuvwxyz'
upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'


def rotate(text, key):
    res = []
    for ch in text:
        if ch.isalpha():
            if ch.islower():
                ch = shift(ch, key, lower)
            else:
                ch = shift(ch, key, upper)
        res.append(ch)
    return ''.join(res)


def shift(ch, key, alpha):
    index = alpha.index(ch)
    new_index = (index + key) % len(alpha)
    return alpha[new_index]
