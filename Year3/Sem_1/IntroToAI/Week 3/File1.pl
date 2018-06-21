% Author:
% Date: 06/10/2016

man(marcus).
pompeian(marcus).
born(marcus,40).

mortal(X) :- man(X).
die(X,Now) :- pompeian(X),gt(Now,79).
alive(X,Now) :- not(die(X,Now)).
gt(Op1,Op2) :- Op1 > Op2.

