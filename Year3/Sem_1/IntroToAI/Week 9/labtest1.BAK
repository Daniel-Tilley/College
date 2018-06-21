% Author: Daniel Tilley - C14337041
% Date: 09/11/2016

%Question 1
person(jane,40,f).
person(john,20,m).
person(paul,50,m).
person(frank,30,m).

works(jane,teacher).
works(john,programmer).
works(paul,salesperson).
works(frank,accountant).

drives(jane,fiat).
drives(john,porsche).
drives(paul,nissan).
drives(frank,bmw).

handsome(john).
handsome(frank).

young(A):-
   A < 31, A > 17.

isMale(N) :-
   N == m.
   
isFemale(N) :-
   N == f.
   
%Checks what males are attractive
attractive(person(N,A,G)) :-
   young(A),
   handsome(N).

%checks what if female thinks male is attractive
attractiveTo(person(FN,FA,FG),person(MN,MA,MG)) :-
   person(FN,FA,FG),
   person(MN,MA,MG),
   isMale(MN),
   isFemale(FN),
   attractive(person(MN,MA,NG)),
   FA > 34,
   drives(MN,bmw),
   works(MN,accountant).


%Question 2
canDriveFrom(dublin, kilkenny).
canDriveFrom(dublin, carlow).
canDriveFrom(kilkenny, waterford).
canDriveFrom(mallow, carlow).
canDriveFrom(cork, mallow).
canDriveFrom(waterford, youghal).
canDriveFrom(youghal, cork).
canDriveFrom(dublin, athlone).
canDriveFrom(athlone, limerick).
canDriveFrom(limerick, cork).

canGoFrom(A,B) :- canDriveFrom(A,B).
canGoFrom(A,B) :-
   canDriveFrom(A,C),
   canGoFrom(C,B).
   
%run using "canGoFrom(name,name)."

%Question 3
canGoFrom(X,Y, go(byCar(X,Y))) :- canDriveFrom(X,Y).

canGoFrom(X,Y, go(byCar(X,Z),G)) :-
  canDriveFrom(X,Z),
  canGoFrom(Z,Y,G).
  
%run using "canGoFrom(name,name,X)."


%Question 4

%added for question 4
canDriveFrom(carlow, dublin).
canDriveFrom(limerick, athlone).

%canGoFrom(X,Y, go(byCar(X,Z),G),[]) :-


%Question 5

%A
addLists([],[],[]).
addLists([H1|T1], [H2|T2], [H3|T3]) :-
  H3 is H1 + H2,
  addLists(T1,T2, T3).

%B
remove(X,[],[]).
remove(X,[X|Tail],Tail).

remove(X,[Y|Tail],[Y|Tail1]):-
   remove(X,Tail,Tail1).
   
%C
mulPairs([],[]).
mulPairs([(H11,H12)|T1], [H2|T2]) :-
  H2 is H11 * H12,
  mulPairs(T1,T2).

%D
count(X,[],N).
count(X,[H1|T1],N):-
   X == H1,
   N is N + 1,
   count(X,T1,N).
   
%E


   
   
