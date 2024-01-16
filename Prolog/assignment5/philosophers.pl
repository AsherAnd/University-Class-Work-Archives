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

%%%%% SECTION: dynamic_philosophers
%%%%% These lines allow you to write statements for a predicate that are not consecutive in your program
%%%%% Doing so enabkes the specification of an initial state in another file
%%%%% DO NOT MODIFY THE CODE IN THIS SECTION
:- dynamic thinking/2.
:- dynamic waiting/2.
:- dynamic eating/2.
:- dynamic available/2. 
:- dynamic has/3.


%%%%% SECTION: planner_philosophers
%%%%% This line loads the generic planner code from the file "planner.pl"
%%%%% Just ensure that that the planner.pl file is in the same directory as this one
%%%%% DO NOT EDIT THIS SECTION
:- [planner].


%%%%% SECTION: init_philosophers
%%%%% Loads the initial state from the file philosophersInit.pl
%%%%% HINT: You can create other files with other initial states to more easily test individual actions
%%%%%       To do so, just replace the line below with one loading in the file with your initial state
:- [philosophersInit].


%%%%% SECTION: goal_states_philosophers
%%%%% Below we define different goal states, each with a different ID
%%%%% HINT: It may be useful to define "easier" goals when starting your program or when debugging
%%%%%       You can do so by adding more goal states below
goal_state(1, S) :- waiting(p1, S).
goal_state(2, S) :- happy(p1, S).
goal_state(3, S) :- happy(p1, S), waiting(p2, S).
goal_state(4, S) :- happy(p1, S), happy(p2, S).
goal_state(5, S) :- happy(p1, S), happy(p2, S), happy(p3,S).



%%%%% SECTION: precondition_axioms_philosophers
%%%%% Write precondition axioms for all actions in your domain. Recall that to avoid
%%%%% potential problems with negation in Prolog, you should not start bodies of your
%%%%% rules with negated predicates. Make sure that all variables in a predicate 
%%%%% are instantiated by constants before you apply negation to the predicate that 
%%%%% mentions these variables.

%%% check to make sure fork is beside philosopher, they don't have it already and it's available
poss(pickUp(P, F), S) :-
	between(P, F, _),
	not has(P, F, S),
	available(F, S).

%%% check to make sure fork is beside philosopher, they already have it, and it's not available
poss(putDown(P, F), S) :-
	between(P, F, _),
	has(P, F, S),
	not available(F, S).

%%% check to make sure philosopher has both forks, and no more than two philosophers currently eating
poss(tryToEat(P), S) :-
	fork(F1),
	fork(F2),
	F1 \= F2,
	has(P, F1, S),
	has(P, F2, S),
	not (philosopher(P1), philosopher(P2), P1 \= P, P2 \= P, P1 \= P2, eating(P1, S), eating(P2, S)).

%%%%% SECTION: successor_state_axioms_philosophers 
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

%%% base case
available(F, [putDown(_, F)]).
%%% latest scenario where fork was just put down
available(F, [putDown(_, F) | _]).
%%% recursive case where fork continues to be available as long as the latest action is not pickUp
available(F, [A|S]) :- not A = pickUp(_, F), available(F, S).

%%% base case where philosopher picks up fork
has(P, F, [pickUp(P, F)]).
%%% another scenario with latest action when philosopher picks up fork
has(P, F, [pickUp(P, F) | _]).
%%% philosopher continues to have fork as long as latest action is not putting down the fork
has(P, F, [A|S]) :- not A = putDown(P, F), has(P, F, S).

%%% base case where philospher starts in thinking state
thinking(P, []).
%%% another scenario where the amount of pickUps and putDowns in the list are equal, which means the philosopher has no
%%% fork which means they are currently thinking
thinking(P, S) :-
	% check to ensure that there is an equal amount of pickUp and putDown actions for the philosopher
	not (member(pickUp(P, F2), S), not member(putDown(P, F2), S)).

%%% TODO
eating(P, [A|S]) :- A = tryToEat(P), poss(tryToEat(P), S).
eating(P, [A|S]) :- eating(P, S), not A = putDown(P, _).

%%% TODO
waiting(P, [pickUp(P, _)]).
waiting(P, [A|S]) :- A = tryToEat(P), not poss(tryToEat(P), S).
waiting(P, [A|S]) :-
	not A = tryToEat(P),
	(member(pickUp(P, F2), S), not member(putDown(P, F2), S)).

%%% TODO
happy(P, [A|S]) :- A = putDown(P, _), eating(P,S).
happy(P, [_|S]) :- happy(P, S).


%%%%% SECTION: declarative_heuristics_philosophers
%%%%% The predicate useless(A,ListOfPastActions) is true if an action A is useless
%%%%% given the list of previously performed actions. The predicate useless(A,ListOfPastActions)
%%%%% helps to solve the planning problem by providing declarative heuristics to 
%%%%% the planner. If this predicate is correctly defined using a few rules, then it 
%%%%% helps to speed-up the search that your program is doing to find a list of actions
%%%%% that solves a planning problem. Write as many rules that define this predicate
%%%%% as you can: think about useless repetitions you would like to avoid, and about 
%%%%% order of execution (i.e., use common sense properties of the application domain). 
%%%%% Your rules have to be general enough to be applicable to any problem in your domain,
%%%%% in other words, they have to help in solving a planning problem for any instance
%%%%% (i.e., any initial and goal states).
%%%%%	
%%%%% write your rules implementing the predicate  useless(Action,History) here. %

useless(pickUp(P, F), History) :- member(pickUp(P, F), History). % don't pick up if picked up before
useless(tryToEat(P), History) :- not member(pickUp(P, _), History). % can't eat if never picked up a fork
useless(putDown(P, F), History) :- not member(pickUp(P, F), History). % can't put down what was never picked up
useless(tryToEat(P), History) :- % variants on ensuring philosopher has eaten before
	(fork(F1), fork(F2), not F1 = F2, member(pickUp(P, F1), History), member(pickUp(P, F2), History),
	member(putDown(P, F1), History)).
useless(tryToEat(P), History) :-
	(fork(F1), fork(F2), not F1 = F2, member(pickUp(P, F1), History), member(pickUp(P, F2), History),
	member(putDown(P, F2), History)).
useless(tryToEat(P), History) :-
	(fork(F1), fork(F2), not F1 = F2, member(pickUp(P, F1), History), member(pickUp(P, F2), History),
	member(putDown(P, F1), History), member(putDown(P, F2), History)).