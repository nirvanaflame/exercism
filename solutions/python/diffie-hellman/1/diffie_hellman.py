import secrets


def private_key(p):
    key = secrets.randbelow(p)
    return 2 if key < 2 else key


def public_key(p, g, private):
    return pow(g, private) % p


def secret(p, public, private):
    return pow(public, private) % p
