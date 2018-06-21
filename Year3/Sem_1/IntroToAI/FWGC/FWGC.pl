:- [adt].
 
go(Start,Goal) :-
    empty_stack(Empty_been_stack),
    stack(Start,Empty_been_stack,Been_stack),
    path(Start,Goal,Been_stack).
   
run:-
    go(state(w,w,w,w) , state(e,e,e,e)).
 
path(Goal,Goal,Been_stack) :-
    write('Solution Path Is:' ), nl,
    reverse_print_stack(Been_stack).
 
path(State,Goal,Been_stack) :-
    move(State,Next_state),
    not(member_stack(Next_state,Been_stack)),
    stack(Next_state,Been_stack,New_been_stack),
    path(Next_state,Goal,New_been_stack),!.
 
move(state(X,X,G,C), state(Y,Y,G,C)):-
    opp(X,Y), not(unsafe(state(Y,Y,G,C))).
 
move(state(X,W,X,C), state(Y,W,Y,C)):-
    opp(X,Y), not(unsafe(state(Y,W,Y,C))).
 
move(state(X,W,G,X), state(Y,W,G,Y)):-
    opp(X,Y), not(unsafe(state(Y,W,G,Y))).
 
move(state(X,W,G,C), state(Y,W,G,C)):-
    opp(X,Y), not(unsafe(state(Y,W,G,C))).
 
move(state(F,W,G,C), state(F,W,G,C)):- fail.
 
 
unsafe(state(X,Y,Y,C)) :- opp(X,Y).
unsafe(state(X,W,Y,Y)) :- opp(X,Y).
 
opp(e,w).
opp(w,e).
 
reverse_print_stack(S) :-
        empty_stack(S).		% when the stack is empty. 
reverse_print_stack(S) :-
        stack(E, Rest, S),
        reverse_print_stack(Rest),
        showState(E), nl. 		% E being current state(X,X,X,X)
		
		
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