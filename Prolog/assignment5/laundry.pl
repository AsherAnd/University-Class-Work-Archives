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

%%%%% SECTION: dynamic_laundry
%%%%% These lines allow you to write statements for a predicate that are not consecutive in your program
%%%%% Doing so enables the specification of an initial state in another file
%%%%% DO NOT MODIFY THE CODE IN THIS SECTION
:- dynamic clean/2.
:- dynamic wet/2.
:- dynamic folded/2.
:- dynamic holding/2.
:- dynamic hasSoap/2.
:- dynamic hasSoftener/2.
:- dynamic hasLint/2.
:- dynamic in/3.
:- dynamic container/1.
    
%%%%% SECTION: planner_laundry
%%%%% This line loads the generic planner code from the file "planner.pl"
%%%%% Just ensure that the planner.pl file is in the same directory as this one
%%%%% DO NOT EDIT THIS SECTION
:- [planner].

%%%%% SECTION: init_laundry
%%%%% Loads the initial state from the file laundryInit.pl
%%%%% HINT: You can create other files with other initial states to more easily test individual actions
%%%%%       To do so, just replace the line below with one loading in the file with your initial state
:- [laundryInit].

%%%%% SECTION: goal_states_laundry
%%%%% Below we define different goal states, each with a different ID
%%%%% HINT: It may be useful to define "easier" goals when starting your program or when debugging
%%%%%       You can do so by adding more goal states below
goal_state(1, S) :- clean(cl1,S).
goal_state(2, S) :- clean(cl1,S), \+ wet(cl1,S).
goal_state(3, S) :- clean(cl1,S), \+ wet(cl1,S), folded(cl1,S), in(cl1,dresser,S).

%%%%% Your program is not required to produce plans for the following long
%%%%% goal state that is optional. But if you want to try it, then
%%%%% try to solve this more difficult planning problem.
goal_state(100, S) :- clean(cl1,S), clean(cl2,S), \+ wet(cl1,S), \+ wet(cl2,S),
        folded(cl1,S), folded(cl2,S), in(cl1,dresser,S), in(cl2,dresser,S).

%%%%% SECTION: precondition_axioms_laundry
%%%%% Write precondition axioms for all actions in your domain. Recall that to avoid
%%%%% potential problems with negation in Prolog, you should not start bodies of your
%%%%% rules with negated predicates. Make sure that all variables in a predicate 
%%%%% are instantiated by constants before you apply negation to the predicate that 
%%%%% mentions these variables. 

% The following defines different types of objects as containers
% You do not need to edit it
container(X) :- washer(X).
container(X) :- dryer(X).
container(X) :- cupboard(X).
container(X) :- hamper(X).
container(dresser).

% Put the rest of your precondition axioms below

%%%%% SECTION: precondition_axioms_laundry

% fetch(O, C): fetch object O from container C. After fetching, the robot is holding O, and it is no longer in C.
% This action is only possible if you are not currently holding anything.

poss(fetch(O, C), S) :- in(O,C,S), container(C), not(holding(_,S)).

% putAway(O, C): put away object O into container C. 
% After doing this action, the robot is no longer holding O, but it is now in C. 
% This action is only possible if you are currently holding O.

poss(putAway(O, C), S) :- holding(O, S), container(C), not(in(O, C, S)).

% addSoap(P, W): after adding soap P to washer W, W has soap. 
% This action is only possible if the robot is holding P, and W does not currently have soap.

poss(addSoap(P, W), S) :- holding(P, S), washer(W), not(hasSoap(W, S)).

% addSoftener(T, W): add fabric softener T to washer W.
% This action is only possible if the robot is holding T and W does not currently have softener.

poss(addSoftener(T, W), S) :- holding(T, S), washer(W), not(hasSoftener(W, S)).

% removeLint(D): remove lint from dryer D. After doing this action, D no longer has lint.
% It is only possible if D currently has lint and the robot is not holding anything.

poss(removeLint(D), S) :- hasLint(D, S), dryer(D), not(holding(_, S)).

% washClothes(C, W): wash clothes C in washer W. In the situation resulting from execution of this action
% C is clean and wet, and W has neither soap nor softener.
% This action is only possible if C is in W, C is not clean, and W has soap and softener.

poss(washClothes(C, W), S) :-
    in(C, W, S),
    washer(W),
    not(clean(C, S)),
    hasSoap(W, S),
    hasSoftener(W, S).

% dryClothes(C, D): dry clothes C in dryer D. In the situation resulting from execution of this action,
% C is not wet, D has lint. The action is only possible if C is in D, C is wet, and D does not have lint.

poss(dryClothes(C, D), S) :- in(C, D, S), wet(C, S), not(hasLint(D, S)).

% fold(C): fold clothes C. This action is only possible if C is not folded,
% clothes are clean and dry, and the robot is not currently holding anything.

poss(fold(C), S) :- clean(C, S), not(wet(C, s)), not(folded(C, S)), not(holding(_, S)).

% wear(C): wear clothes C. After doing this action, C is neither clean nor folded.
% This action is only possible if C is folded.

poss(wear(C), S) :- folded(C, S).

% move(C, F, T): move clothes C from a location F to a different location T. After doing this action,
% C is in T, but it is no longer in F. The robot can do this action if it is not currently holding anything,
% C is in F, both F and T are containers. The container can be a dresser, or a hamper, or a washer, or a dryer that is empty.

poss(move(C, F, T), S) :- in(C, F, S), not(holding(_, S)), container(F), container(T), F \= T.

%%%%% SECTION: successor_state_axioms_laundry 
%%%%% Write successor-state axioms that characterize how the truth value of all 
%%%%% fluents change from the current situation S to the next situation [A | S]. 
%%%%% You will need two types of rules for each fluent: 
%%%%% 	(a) rules that characterize when a fluent becomes true in the next situation 
%%%%%	as a result of the last action, and
%%%%%	(b) rules that characterize when a fluent remains true in the next situation,
%%%%%	unless the most recent action changes it to false.
%%%%% When you write successor state axioms, you can sometimes start bodies of rules 
%%%%% with negation of a predicate, e.g., with negation of equality. This can help 
%%%%% to make them a bit more efficient.
%%%%%
%%%%% Write your successor state rules here: you have to write brief comments %

% in(O, C, S): object O is inside C in situation S.

in(O, C, [putAway(O, C)|_]).
in(O,C,[A|S]) :- not(A=fetch(O, C)), in(O, C, S).

% holding(O,S): the robot is holding object O in situation S after fetching O from somewhere.
% The robot is no longer holding an object, if the robot put it away,
% or if the object is added to a washer machine, in the case that the object is a soap or a fabric softener.

holding(O, [fetch(O, C)|_]).
holding(O, [A|S]) :- not(A=putAway(O,_)),holding(O, S).

% hasSoap(W, S): washer W has soap in situation S.

hasSoap(W, [addSoap(P, W)| _]).
hasSoap(W, [A|S]) :- not(A=washClothes(_, W)),hasSoap(W, S).

% hasSoftener(W,S): washer W has fabric softener in situation S.

hasSoftener(W, [addSoftener(P, W)| _]).
hasSoftener(W, [A|S]) :- not(A=washClothes(_, W)),hasSoftener(W, S).

% hasLint(D,S): dryer D has lint in situation S.

hasLint(D, [removeLint(D)| _]).
hasList(D, [A|S]) :- not(A=removeLint(D)), hasLint(D, S).

% clean(C, S): clothes C are clean in situation S.

clean(C,[washClothes(C, W)|_]).
clean(C, [A|S]) :- not(A=wear(C)), clean(C, S).

% wet(C,S): clothes C are wet in situation S (after washing, and before drying).

wet(C, [washClothes(C, W)|_]).
wet(C, [A|S]) :- not(A=dryClothes(C,_)), wet(C, S).

% folded(C,S): clothes C are folded in situation S.

folded(C, [fold(C)|_]).
folded(C, []) :- not(A=wear(C)), folded(C, S).

%%%%% SECTION: declarative_heuristics_laundry
%%%%% The predicate useless(A,ListOfPastActions) is true if an action A is useless
%%%%% given the list of previously performed actions. The predicate useless(A,ListOfPastActions)
%%%%% helps solve the planning problem by providing declarative heuristics to 
%%%%% the planner. If this predicate is correctly defined using a few rules, then it 
%%%%% helps speed-up the search that your program is doing to find a list of actions
%%%%% that solves a planning problem. Write as many rules that define this predicate
%%%%% as you can: think about useless repetitions you would like to avoid, and about 
%%%%% order of execution (i.e., use common sense properties of the application domain). 
%%%%% Your rules have to be general enough to be applicable to any problem in your domain,
%%%%% in other words, they have to help in solving a planning problem for any instance
%%%%% (i.e., any initial and goal states).
%%%%%	
%%%%% write your rules implementing the predicate  useless(Action,History) here. %

useless(fetch(O, _), History) :-
    member(holding(O, _), History).

useless(putAway(O, _), History) :-
    \+ member(holding(O, _), History).

useless(addSoap(_, W), History) :-
    member(hasSoap(W, _), History).

useless(addSoftener(_, W), History) :-
    member(hasSoftener(W, _), History).

useless(washClothes(C, _), History) :-
    member(clean(C, _), History).

useless(dryClothes(C, _), History) :-
    \+ member(wet(C, _), History).

useless(fold(C), History) :-
    member(folded(C, _), History).

useless(move(C, F, _), History) :-
    member(in(C, F, _), History).

useless(wear(C), History) :-
    member(clean(C, _), History),
    member(folded(C, _), History).