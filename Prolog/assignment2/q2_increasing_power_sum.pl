% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Asher Andargachew
%%%%% NAME: Khushi Chowdhury
%%%%% NAME: Wathaned Ean
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: increasingPowerSum
%%%%% Predicate definition: increasingPowerSum(List, Power, PowerInc, Sum)

increasingPowerSum([], _, _, 0).

increasingPowerSum([H|T], Power, PowerInc, Sum):-
    NextPower is Power+PowerInc,
    increasingPowerSum(T, NextPower, PowerInc, NewSum),
    FinalSum is H^Power + NewSum,
    Sum is FinalSum.
    