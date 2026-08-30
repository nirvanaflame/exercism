def transform(legacy_data: dict):
    dic = {str(letter).lower(): rate for rate, letters in legacy_data.items() for letter in letters}
    return {k: dic[k] for k in sorted(dic)}
