
member(X,[X|_]).
member(X,[_|T]):-member(X,T).

empty_stack([]).

member_stack(E, S) :- member(E, S).


stack(E, S, [E|S]).

empty_queue([]).


member_queue(E, S) :- member(E, S).


add_to_queue(E, [], [E]).
add_to_queue(E, [H|T], [H|Tnew]) :- add_to_queue(E, T, Tnew).

remove_from_queue(E, [E|T], T).

append_queue(First, Second, Concatenation) :- 
    append(First, Second, Concatenation).

empty_set([]).

member_set(E, S) :- member(E, S).

add_to_set(X, S, S) :- member(X, S), !.
add_to_set(X, S, [X|S]).

remove_from_set(_, [], []).
remove_from_set(E, [E|T], T) :- !.
remove_from_set(E, [H|T], [H|T_new]) :-
    remove_from_set(E, T, T_new), !.
    
union([], S, S).
union([H|T], S, S_new) :- 
    union(T, S, S2),
    add_to_set(H, S2, S_new).   
    
intersection([], _, []).
intersection([H|T], S, [H|S_new]) :-
    member_set(H, S),
    intersection(T, S, S_new),!.
intersection([_|T], S, S_new) :-
    intersection(T, S, S_new),!.
    
set_diff([], _, []).
set_diff([H|T], S, T_new) :- 
    member_set(H, S), 
    set_diff(T, S, T_new),!.
set_diff([H|T], S, [H|T_new]) :- 
    set_diff(T, S, T_new), !.

subset([], _).
subset([H|T], S) :- 
    member_set(H, S), 
    subset(T, S).

equal_set(S1, S2) :- 
    subset(S1, S2), subset(S2, S1).
    
empty_sort_queue([]).

member_sort_queue(E, S) :- member(E, S).

insert_sort_queue(State, [], [State]).  
insert_sort_queue(State, [H | T], [State, H | T]) :- 
    precedes(State, H).
insert_sort_queue(State, [H|T], [H | T_new]) :- 
    insert_sort_queue(State, T, T_new). 
    
remove_sort_queue(First, [First|Rest], Rest).