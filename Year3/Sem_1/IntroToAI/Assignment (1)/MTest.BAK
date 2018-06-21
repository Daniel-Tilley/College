empty_stack([]).
stack(E, S, [E|S]).

go(Start,Goal) :-
    empty_stack(Empty_been_stack),
    stack(Start,Empty_been_stack,Been_stack),
    path(Start,Goal,Been_stack).
        
run:-
    go(state(3,3,1) , state(0,0,0)).
        
path(Goal,Goal,Been_stack) :-
    write('Solution Path Is:' ), nl,
    reverse_print_stack(Been_stack).
 
path(State,Goal,Been_stack) :-
    move(State,Next_state),
    not(member_stack(Next_state,Been_stack)),
    stack(Next_state,Been_stack,New_been_stack),
    path(Next_state,Goal,New_been_stack),!.     

        
safe(0, _).
safe(3, _).
safe(X, X).
        
move(state( M1, C1, 1), state( M2, C1, 0)) :- 
        M1 > 1, M2 is M1-2, safe(M2, C1).  % Two missionaries from east to west

move(state( M1, C1, 0), state( M2, C1, 1)) :- 
        M1 < 2, M2 is M1+2, safe(M2, C1).  % Two missionaries from west to east

move(state( M1, C1, 1), state( M1, C2, 0)) :- 
        C1 > 1, C2 is C1-2, safe(M1, C2).  % Two cannibals from east to west

move(state( M1, C1, 0), state( M1, C2, 1)) :- 
        C1 < 2, C2 is C1+2, safe(M1, C2).  % Two cannibals from west to east

move(state( M1, C1, 1), state( M1, C2, 0)) :- 
        C1 > 0, C2 is C1-1, safe(M1, C2).  % One cannibal from east to west

move(state( M1, C1, 0), state( M1, C2, 1)) :- 
        C1 < 3, C2 is C1+1, safe(M1, C2).  % One cannibal from west to east

move(state( M1, C1, 1), state( M2, C2, 0)) :- 
        M1 > 0, M2 is M1-1,  % One missionary and one cannibal from east to west
    C1 > 0, C2 is C1-1, safe(M2, C2).   

move(state( M1, C1, 0), state( M2, C2, 1)) :- 
        M1 < 3, M2 is M1+1,  % One missionary and one cannibal from west to east
    C1 < 3, C2 is C1+1, safe(M2, C2).
        
        
reverse_print_stack(S) :-
        empty_stack(S).         % when the stack is empty. 
reverse_print_stack(S) :-
        stack(E, Rest, S),
        reverse_print_stack(Rest),
        showState(E), nl.               
                
showState(S) :-
    showWest(S), write('|~~~~~~~|'), showEast(S),nl,
    write('    |~~~~~~~|').

showWest(state(M1,C1,B)) :-
    (B == 1, write('B'), !; write(' ')),
    (C1 == 1, write('C1'),!;C1 == 2, write('C2'),!;C1 == 3, write('C3'), !; write(' ')),
    (M1 == 1, write('M1'),!;M1 == 2, write('M2'),!;M1 == 3, write('M3'), !; write(' ')).

showEast(state(M2,C2,B)) :-
    (B == 0, write('B'), !; true),
    (C2 == 0, write('C3'),!;C2 == 1, write('C2'),!;C2 == 2, write('C1'),!;C2 == 3, write(' '), !; true),
    (M2 == 0, write('M3'),!;M2 == 1, write('M2'),!;M2 == 2, write('M1'),!;M2 == 3, write(' '), !; true).