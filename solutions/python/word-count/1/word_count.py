import re
from collections import Counter


def count_words(sentence: str) -> {}:
    clean = re.sub(r'[^a-zA-Z0-9\']', " ", sentence)
    split = clean.strip().split(" ")

    def strip_quote(word: str) -> str:
        if word.startswith("'") and word.endswith("'"):
            return word[1:-1]
        if word.startswith("'"):
            return word[1:]
        if word.endswith("'"):
            return word[0:-1]
        return word

    def strip_quotes(word: str) -> str:
        while word.startswith("'") or word.endswith("'"):
            word = strip_quote(word)
        return word

    to_add = [strip_quotes(word.lower()) for word in split]

    dic = Counter([word for word in to_add if word != ""])
    return dict(dic)