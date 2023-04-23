import string


def find_anagrams(word, candidates):
    candidates = list(filter(lambda x: word.lower() != x.lower(), candidates))
    word = encode_anagram(word)
    return [candidate for candidate in candidates if is_anagram(word, encode_anagram(candidate))]


def encode_anagram(word):
    if " " in word:
        return "-1"

    mem = [0] * len(string.ascii_lowercase)
    for ch in word.lower():
        index = string.ascii_lowercase.index(ch)
        mem[index] += 1
    return str(mem)


def is_anagram(word, candidate):
    return word == candidate
