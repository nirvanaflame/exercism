armstrong_number(N) :-
    number_to_digits(N, Digits),
    length(Digits, Length),
    sum_digits_power(Digits, Length, Sum),
    N =:= Sum.


number_to_digits(Number, Digits) :-
    number_codes(Number, Codes),
    maplist(code_to_digit, Codes, Digits).


code_to_digit(Code, Digit) :-
    Digit is Code - 48.


sum_digits_power([], _, 0).


sum_digits_power([H|T], Length, Sum) :-
    power_of(H, Length, Powed),
    sum_digits_power(T, Length, RestSum),
    Sum is Powed + RestSum.


power_of(Number, Power, Result) :-
    Result is Number ** Power.
