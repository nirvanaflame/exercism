arabic_values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
roman_numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]


def roman(number):

    roman_numeral = ""
    for i in range(len(arabic_values)):
        while number >= arabic_values[i]:
            roman_numeral += roman_numerals[i]
            number -= arabic_values[i]

    return roman_numeral

