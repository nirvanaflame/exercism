%degenerate
triangle(S1, S2, S3, _) :- S1 + S2 < S3, !, fail.
triangle(S1, S2, S3, _) :- S2 + S3 < S1, !, fail.
triangle(S1, S2, S3, _) :- S3 + S1 < S2, !, fail.
%zero
triangle(S1, S2, S3, _) :- S1 = 0, S2 = 0, S3 = 0, !,	fail.

triangle(S1, S2, S3, "equilateral") :- S1 = S2, S2 = S3, S2 = S1, !.
triangle(S1, S2, S3, "scalene") :- S1 \= S2, S2 \= S3, S2 \= S1, !.
triangle(S, S, _, "isosceles") :- !.
triangle(S, _, S, "isosceles") :- !.
triangle(_, S, S, "isosceles") :- !.