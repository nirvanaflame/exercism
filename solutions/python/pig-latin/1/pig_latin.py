def translate(text):
    return ' '.join([encode(word) for word in text.split()])


def encode(text):
    cp = text
    text = when_vowel(text)
    text = when_three_cons(text)
    text = when_two_cons(text) 
    text = when_consonant(text) if cp == text else text         

    return text


def when_vowel(text):
    if text.startswith('xr') or text.startswith('yt') or text[0] in 'aeiou':
        return text + 'ay' 
    return text


def when_consonant(text):
    if text[0] in 'bcdfghjklmnpqrstvwxyz':
        l = list(text)
        l.append(l.pop(0)+'ay')
        return ''.join(l)
    return text


def when_two_cons(text):
    if text.startswith('ch') or text.startswith('qu') or text.startswith('th') or text.startswith('rh'):
        l = list(text)
        f = l.pop(0) + l.pop(0)
        l.append(f+'ay')
        return ''.join(l)
    return text


def when_three_cons(text):
    if text.startswith('squ') or text.startswith('thr') or text.startswith('sch'):
        l = list(text)
        f = l.pop(0) + l.pop(0) + l.pop(0)
        l.append(f+'ay')
        return ''.join(l)
    return text
