mem = []


def is_paired(input_string):
    mem.clear()

    for char in input_string:
        if char in '[({':
            mem.extend(char)
        elif char in '])}':
            try:
                last = mem.pop()
                if not is_opposite(last, char):
                    return False
            except IndexError:
                return False
    return len(mem) == 0


def is_opposite(saved: str, current: str) -> bool:
    match current:
        case ']':
            return saved == '['
        case '}':
            return saved == '{'
        case ')':
            return saved == '('
        case _:
            return False
