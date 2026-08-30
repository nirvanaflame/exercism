def response(hey_bob):
    str = hey_bob.strip()

    if not str:
        return "Fine. Be that way!"

    isquestion = str.endswith("?")
    isshout = any(c.isalpha() for c in str) and str == str.upper()

    res = ""
    match (isquestion, isshout):
        case (True, True):
            res = "Calm down, I know what I'm doing!" 
        case (_, True):
            res = "Whoa, chill out!"
        case (True, _):
            res = "Sure."
        case _:
            res = "Whatever."
    return res
