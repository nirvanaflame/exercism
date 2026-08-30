triangle(Side1, Side2, Side3, Type) :- is_triangle(Side1, Side2, Side3),
    (((Type = "equilateral"; Type = "isosceles"), is_equilateral(Side1, Side2, Side3));
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
