% Author:
% Date: 20/10/2016

opp(e,w).
opp(w,e).

unsafe(state(X,Y,Y,C)):-opp(X,Y).
unsafe(state(X,W,Y,Y)):-opp(X,Y).

move(state(X,X,G,C),state(Y,Y,G,C)):-
opp(X,Y),not(unsafe(state(Y,Y,G,C))).

move(state(X,W,X,C),state(Y,W,Y,C)):-
opp(X,Y),not(unsafe(state(Y,W,Y,C))).

move(state(X,W,G,X),state(Y,W,G,Y)):-
opp(X,Y),not(unsafe(state(Y,W,G,Y))).

move(state(X,W,G,C),state(Y,W,G,C)):-
opp(X,Y),not(unsafe(state(Y,W,G,C))).

start(state(e,e,e,e)).
goal(state(w,w,w,w)).

solve(X,Soln):-
solve(X,[],Sol),
reverse(Sol,Soln).

solve(State,Path,[State|Path]):-
goal(State).

solve(State,Path,Sol):-
move(State,NewState),
not(member(NewState,Path)),
solve(NewState,[State|Path],Sol).

showSol([]).
showSol([H|T]) :- showState(H), showSol(T).

showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S),nl,
    write('    |~~~~~~~|').

showWest(state(F,W,G,C)) :-
    (F == w, write('F'), !; write(' ')),
    (W == w, write('W'), !; write(' ')),
    (G == w, write('G'), !; write(' ')),
    (C == w, write('C'), !; write(' ')).

showEast(state(F,W,G,C)) :-
    (F == e, write('F'), !; true),
    (W == e, write('W'), !; true),
    (G == e, write('G'), !; true),
    (C == e, write('C'), !; true).