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

%%%%% SECTION: zipper
%%%%% Predicate definition: zipper(List1, List2, Zipper)

% EMPTY BASE CASE
zipper([], [], []). 

% CASE WHERE FIRST LIST IS EMPTY
zipper([], [Head2|Tail2], [Head2|Zipper]) :-
    zipper([], Tail2, Zipper).

% CASE WHERE SECOND LIST IS EMPTY
zipper([Head1|Tail1], [], [Head1|Zipper]) :-
    zipper(Tail1, [], Zipper).

% FIRST RECURSIVE CASE, START WITH FIRST LIST, ADD HEAD TO ZIPPER, TAIL TO RECURSIVE CALL
zipper([Head1|Tail1], List2, [Head1|Zipper]) :-
    zipper(List2, Tail1, Zipper).

% OTHER RECURSIVE CASE, START WITH SECOND LIST, ADD HEAD TO ZIPPER, TAIL TO RECURSIVE CALL
zipper(List1, [Head2|Tail2], [Head2|Zipper]) :-
    zipper(List1, Tail2, Zipper).