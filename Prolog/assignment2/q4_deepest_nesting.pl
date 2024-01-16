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

%%%%% SECTION: deepestNesting
%%%%% Predicate definition: deepestNesting(List, Depth)
:- use_module(library(lists)).

 % BASE CASE
deepestNesting([], 0).

% BASE CASE FOR NON-LIST
deepestNesting(Atom, 0) :-
	\+ is_list(Atom).

% RECURSIVE CASE, FIND IF NON-EMPTY LIST AND USE HELPER FUNCTION
deepestNesting(List, Depth) :-
    is_list(List),
    List \= [],
    findDeepestNesting(List, 0, Depth).

findDeepestNesting([], CurrDepth, CurrDepth). 

findDeepestNesting([H|T], CurrDepth, DeepestDepth) :-
    \+ is_list(H),
	findDeepestNesting(T, CurrDepth, DeepestDepth).

findDeepestNesting([H|T], CurrDepth, DeepestDepth) :-
    is_list(H),
	% CODE ADDS 1 TO CURRDEPTH WITHOUT CHECKING IF HEAD IS ACTUALLY DEEPER THAN THE DEEPESTDEPTH
    NewDepth is CurrDepth + 1,
    findDeepestNesting(H, NewDepth, MaxDepth),
    findDeepestNesting(T, MaxDepth, DeepestDepth).