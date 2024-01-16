% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Khushi Chowdhury
%%%%% NAME: Asher Andargachew
%%%%% NAME: Wathaned Ean
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: partitionMonths
%%%%% Predicate definition: partitionMonths(Months, Prices, Increase, Decrease)

% Base Cases
partitionMonths([], [], _, _) :- fail.
partitionMonths([X], [Y], _, _) :- fail.
partitionMonths([_], [_], [], []).

% Recursive code
partitionMonths([M1, M2 | Mtail], [P1, P2 | Ptail], [M2 | Increase], Decrease) :-
    P2 > P1,
    partitionMonths([M2 | Mtail], [P2 | Ptail], Increase, Decrease).

partitionMonths([M1, M2 | Mtail], [P1, P2 | Ptail], Increase, [M2 | Decrease]) :-
    P2 < P1,
    partitionMonths([M2 | Mtail], [P2 | Ptail], Increase, Decrease).

partitionMonths([M1, M2 | Mtail], [P1, P2 | Ptail], [M2 | Increase], Decrease) :-
    P2 =:= P1,
    partitionMonths([M2 | Mtail], [P2 | Ptail], Increase, Decrease).