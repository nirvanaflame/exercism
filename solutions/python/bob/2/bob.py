def response(hey_bob):
    str = hey_bob.strip()

    if not str:
        return "Fine. Be that way!"

    isquestion = str.endswith("?")
    isshout = any(c.isalpha() for c in str) and str == str.upper()

    match (isquestion, isshout):
        case (True, True):
            return "Calm down, I know what I'm doing!" 
        case (_, True):
            return "Whoa, chill out!"
        case (True, _):
            return "Sure."
        case _:
            return "Whatever."
