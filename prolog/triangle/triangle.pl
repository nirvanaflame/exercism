%degenerate
triangle(S1, S2, S3, _) :- S1 + S2 < S3, !, fail.
triangle(S1, S2, S3, _) :- S2 + S3 < S1, !, fail.
triangle(S1, S2, S3, _) :- S3 + S1 < S2, !, fail.
%zero
triangle(S1, S2, S3, _) :- S1 = 0, S2 = 0, S3 = 0, !, fail.

triangle(S1, S2, S3, "equilateral") :- S1 = S2, S2 = S3, S2 = S1, !.
triangle(S1, S2, S3, "scalene") :- S1 \= S2, S2 \= S3, S2 \= S1, !.
triangle(S, S, _, "isosceles") :- !.
triangle(S, _, S, "isosceles") :- !.
triangle(_, S, S, "isosceles") :- !.




%mine shame
triangle(Side1, Side2, Side3, Type) :- is_triangle(Side1, Side2, Side3),
    ((Type = "equilateral", is_equilateral(Side1, Side2, Side3));
    (Type = "isosceles", is_isosceles(Side1, Side2, Side3));
    (Type = "scalene", is_scalene(Side1, Side2, Side3))).

is_equilateral(Side1, Side2, Side3) :- Side1 =:= Side2, Side1 =:= Side3.

is_isosceles(Side1, Side2, Side3) :-
    (Side1 =:= Side2, Side1 =\= Side3);
    (Side1 =:= Side3, Side1 =\= Side2);
    (Side2 =:= Side3, Side2 =\= Side1).

is_scalene(Side1, Side2, Side3) :-
    (Side1 =\= Side2, Side1 =\= Side3, Side2 =\= Side3).

is_triangle(Side1, Side2, Side3) :-
    Side1 + Side2 >= Side3,
    Side2 + Side3 >= Side1,
    Side1 + Side3 >= Side2,
    Side1 =\= 0.
