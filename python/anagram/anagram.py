import string


def find_anagrams(word, candidates):
    return [
        x
        for x in candidates
        if word.casefold() != x.casefold()
        and sorted(word.casefold()) == sorted(x.casefold())
    ]
