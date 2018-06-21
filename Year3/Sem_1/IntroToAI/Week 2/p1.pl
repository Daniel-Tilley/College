% Author:
% Date: 21/09/2016

man(jim).
man(mary).
mortal(X) :- man(X).
likes(X,A) :- man(X), dog(A).

dog(rex).
dog(lassie).

% Dog is Y and Cat is Cat hates dog.
hates(X,Y) :- cat(X), dog(Y).
chases(Y,X) :- dog(Y), cat(X).

cat(bob).
cat(tom).