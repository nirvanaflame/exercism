def commands(binary_str):
    result = [encode(binary_str[-1], "wink"),
              encode(binary_str[-2], "double blink"),
              encode(binary_str[-3], "close your eyes"),
              encode(binary_str[-4], "jump")]

    if binary_str[-5] == "1":
        result.reverse()

    return [x for x in result if x != ""]


def encode(ch, code):
    if ch == "1":
        return code
    return ""
