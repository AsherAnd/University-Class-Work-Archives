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

%%%%% SECTION: appendT
%%%%% Add your rules for appendT(Term1,Term2,Result) below

%Base case
appendT(nil, List, List).

%Recursive Case
appendT(next(Head, Tail), List2, next(Head, Result)) :-
    appendT(Tail, List2, Result).


%%%%% SECTION: list2term
%%%%% Add your rules for list2term(List,Term) below

%Base case
list2term([], nil).

%Recursive Case
list2term([H|T], Term) :-
    \+ atom(H),
    list2term(H, HTerm),
    list2term(T, TTerm),
    Term = next(HTerm, TTerm).

list2term([H|T], Term) :-
    atom(H),
    list2term(T, TTerm),
    Term = next(H, TTerm).

%%%%% SECTION: flat
%%%%% Add your rules for flat(Term,FlatTerm) below

%Base case
flat(nil, nil).

flat(next(H, T), FlatTerm) :-
    \+ atom(H),
    !,
    flat(H, FlatH),
    flat(T, FlatT),
    appendT(FlatH, FlatT, FlatTerm).

flat(next(H, T), next(H, FlatT)) :-
    flat(T, FlatT).