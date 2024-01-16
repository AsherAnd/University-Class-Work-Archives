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

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

% necessary libraries for lists and constraints
:- lib(ic).
:- lib(listut).

% base cases for empty list, 1 element or similar elements, these constraints reduces space.
alldifferent([]).
alldifferent([_]).
alldifferent([H | T]) :-
    maplist(not_equal(H), T),
    alldifferent(T).

not_equal(X, Y) :- X #\= Y.

optimized_solve(Vars) :-
    Vars = [L, E, T, A, P, O, S, V],
    Vars :: 0..9,
    alldifferent(Vars),
    % eliminating possibilities of under 0, which quickens the process.
    L #> 0,
    S #> 0,
    % Narrows down the space, ensure left equals right and focuses on constraints after the initial constrains.
    (100*L + 10*E + T) * (100*L + 10*A + P) #= (10000*T + 1000*O + 100*O + 10*L + S),
    labeling(Vars).


solve_and_print :-
    statistics(runtime, [Start | _]), 
    solve([L, E, T, A, P, O, S, V]),
    statistics(runtime, [End | _]), 
    TimeRounded is End - Start,
    printf("Solution:%n", []),
    printf("  %d %d %d%n", [L, E, T]),
    printf("* %d %d %d%n", [L, A, P]),
    printf("--------------%n", []),
    I is 1,
    printf("      %d %d %d%n", [I, T, S]),
    printf("+ %d %d %d %d%n", [L, O, V, E]),
    printf("  %d %d %d%n", [L, E, T]),
    printf("--------------%n", []),
    printf("  %d %d %d %d %d%n", [T, O, O, L, S]).
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

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

% necessary libraries for lists and constraints
:- lib(ic).
:- lib(listut).

% base cases for empty list, 1 element or similar elements, these constraints reduces space.
alldifferent([]).
alldifferent([_]).
alldifferent([H | T]) :-
    maplist(not_equal(H), T),
    alldifferent(T).

not_equal(X, Y) :- X #\= Y.

optimized_solve(Vars) :-
    Vars = [L, E, T, A, P, O, S, V],
    Vars :: 0..9,
    alldifferent(Vars),
    % eliminating possibilities of under 0, which quickens the process.
    L #> 0,
    S #> 0,
    % Narrows down the space, ensure left equals right and focuses on constraints after the initial constrains.
    (100*L + 10*E + T) * (100*L + 10*A + P) #= (10000*T + 1000*O + 100*O + 10*L + S),
    labeling(Vars).


solve_and_print :-
    statistics(runtime, [Start | _]), 
    solve([L, E, T, A, P, O, S, V]),
    statistics(runtime, [End | _]), 
    TimeRounded is End - Start,
    printf("Solution:%n", []),
    printf("  %d %d %d%n", [L, E, T]),
    printf("* %d %d %d%n", [L, A, P]),
    printf("--------------%n", []),
    I is 1,
    printf("      %d %d %d%n", [I, T, S]),
    printf("+ %d %d %d %d%n", [L, O, V, E]),
    printf("  %d %d %d%n", [L, E, T]),
    printf("--------------%n", []),
    printf("  %d %d %d %d %d%n", [T, O, O, L, S]).
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

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

% necessary libraries for lists and constraints
:- lib(ic).
:- lib(listut).

% base cases for empty list, 1 element or similar elements, these constraints reduces space.
alldifferent([]).
alldifferent([_]).
alldifferent([H | T]) :-
    maplist(not_equal(H), T),
    alldifferent(T).

not_equal(X, Y) :- X #\= Y.

optimized_solve(Vars) :-
    Vars = [L, E, T, A, P, O, S, V],
    Vars :: 0..9,
    alldifferent(Vars),
    % eliminating possibilities of under 0, which quickens the process.
    L #> 0,
    S #> 0,
    % Narrows down the space, ensure left equals right and focuses on constraints after the initial constrains.
    (100*L + 10*E + T) * (100*L + 10*A + P) #= (10000*T + 1000*O + 100*O + 10*L + S),
    labeling(Vars).


solve_and_print :-
    statistics(runtime, [Start | _]), 
    solve([L, E, T, A, P, O, S, V]),
    statistics(runtime, [End | _]), 
    TimeRounded is End - Start,
    printf("Solution:%n", []),
    printf("  %d %d %d%n", [L, E, T]),
    printf("* %d %d %d%n", [L, A, P]),
    printf("--------------%n", []),
    I is 1,
    printf("      %d %d %d%n", [I, T, S]),
    printf("+ %d %d %d %d%n", [L, O, V, E]),
    printf("  %d %d %d%n", [L, E, T]),
    printf("--------------%n", []),
    printf("  %d %d %d %d %d%n", [T, O, O, L, S]).
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

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

% necessary libraries for lists and constraints
:- lib(ic).
:- lib(listut).

% base cases for empty list, 1 element or similar elements, these constraints reduces space.
alldifferent([]).
alldifferent([_]).
alldifferent([H | T]) :-
    maplist(not_equal(H), T),
    alldifferent(T).

not_equal(X, Y) :- X #\= Y.

optimized_solve(Vars) :-
    Vars = [L, E, T, A, P, O, S, V],
    Vars :: 0..9,
    alldifferent(Vars),
    % eliminating possibilities of under 0, which quickens the process.
    L #> 0,
    S #> 0,
    % Narrows down the space, ensure left equals right and focuses on constraints after the initial constrains.
    (100*L + 10*E + T) * (100*L + 10*A + P) #= (10000*T + 1000*O + 100*O + 10*L + S),
    labeling(Vars).


solve_and_print :-
    statistics(runtime, [Start | _]), 
    solve([L, E, T, A, P, O, S, V]),
    statistics(runtime, [End | _]), 
    TimeRounded is End - Start,
    printf("Solution:%n", []),
    printf("  %d %d %d%n", [L, E, T]),
    printf("* %d %d %d%n", [L, A, P]),
    printf("--------------%n", []),
    I is 1,
    printf("      %d %d %d%n", [I, T, S]),
    printf("+ %d %d %d %d%n", [L, O, V, E]),
    printf("  %d %d %d%n", [L, E, T]),
    printf("--------------%n", []),
    printf("  %d %d %d %d %d%n", [T, O, O, L, S]).
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

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

% necessary libraries for lists and constraints
:- lib(ic).
:- lib(listut).

% base cases for empty list, 1 element or similar elements, these constraints reduces space.
alldifferent([]).
alldifferent([_]).
alldifferent([H | T]) :-
    maplist(not_equal(H), T),
    alldifferent(T).

not_equal(X, Y) :- X #\= Y.

optimized_solve(Vars) :-
    Vars = [L, E, T, A, P, O, S, V],
    Vars :: 0..9,
    alldifferent(Vars),
    % eliminating possibilities of under 0, which quickens the process.
    L #> 0,
    S #> 0,
    % Narrows down the space, ensure left equals right and focuses on constraints after the initial constrains.
    (100*L + 10*E + T) * (100*L + 10*A + P) #= (10000*T + 1000*O + 100*O + 10*L + S),
    labeling(Vars).


solve_and_print :-
    statistics(runtime, [Start | _]), 
    solve([L, E, T, A, P, O, S, V]),
    statistics(runtime, [End | _]), 
    TimeRounded is End - Start,
    printf("Solution:%n", []),
    printf("  %d %d %d%n", [L, E, T]),
    printf("* %d %d %d%n", [L, A, P]),
    printf("--------------%n", []),
    I is 1,
    printf("      %d %d %d%n", [I, T, S]),
    printf("+ %d %d %d %d%n", [L, O, V, E]),
    printf("  %d %d %d%n", [L, E, T]),
    printf("--------------%n", []),
    printf("  %d %d %d %d %d%n", [T, O, O, L, S]).
