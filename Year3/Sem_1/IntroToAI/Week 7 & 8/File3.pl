% Author:
% Date: 08/11/2016

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

travelFromTo(X,Y) :- directTrain(X,Y).
travelFromTo(X,Y) :-
  directTrain(X,Z),
  travelFromTo(Z,Y).
  
%% Base cases
travel1(X,Y) :- byCar(X,Y).
travel1(X,Y) :- byPlane(X,Y).
travel1(X,Y) :- byTrain(X,Y).

%% Inductive cases
travel1(X,Y) :-
  byCar(X,Z),
  travel1(Z,Y).
travel1(X,Y) :-
  byPlane(X,Z),
  travel1(Z,Y).
travel1(X,Y) :-
  byTrain(X,Z),
  travel1(Z,Y).
  
%base cases
travel(X,Y, go(byCar(X,Y))) :- byCar(X,Y).
travel(X,Y, go(byTrain(X,Y))) :- byTrain(X,Y).
travel(X,Y, go(byPlane(X,Y))) :- byPlane(X,Y).

%% Inductive cases
travel(X,Y, go(byCar(X,Z),G)) :-
  byCar(X,Z),
  travel(Z,Y,G).

travel(X,Y, go(byTrain(X,Z),G)) :-
  byTrain(X,Z),
  travel(Z,Y,G).

travel(X,Y, go(byPlane(X,Z),G)) :-
  byPlane(X,Z),
  travel(Z,Y,G).

