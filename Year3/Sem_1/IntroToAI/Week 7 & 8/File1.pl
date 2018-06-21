% Author: Daniel Tilley
% Date: 08/11/2016

%Question 1
house_elf(dobby).
witch(hermione).
witch('McGonagal').
magic(X):- house_elf(X).
magic(X):- wizard(X).
magic(X):- witch(X).

