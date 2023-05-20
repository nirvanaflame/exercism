def sum_of_multiples(level: int, multiples: []):
    mem = set()
    for multiply in multiples:
        base = multiply
        while base != 0 and base < level:
            mem.add(base)
            base += multiply
    return sum(mem)
