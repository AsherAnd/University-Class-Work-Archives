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

%%%%% SECTION: networkSolve
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments

fname(catarina).
fname(lizzie).
fname(mona).
fname(anthony).
fname(daniel).
fname(jaime).

lname(elby).
lname(kim).
lname(osborne).
lname(tsuji).
lname(wolverton).
lname(zickerman).

website(bananas.com). 
website(firstbank.com).
website(netvue.com).
website(pricenet.com).
website(sysworld.com).
website(univmoose.edu).

num(1).
num(2).
num(3).
num(4).
num(5).
num(6).

uniq_sys(S1, S2, S3, S4, S5, S6) :-
	dif(S1,S2),
	dif(S2,S3),
	dif(S1,S3),
	dif(S1,S4),
	dif(S1,S5),
	dif(S1,S6),
	dif(S2,S4),
	dif(S2,S5),
	dif(S2,S6),
	dif(S3,S4),
	dif(S3,S5),
	dif(S3,S6),
	dif(S4,S5),
	dif(S4,S6),
	dif(S5,S6).

not_in(X, Lst) :- maplist(dif(X), Lst).

solve(Fin) :-
	Fin = [[catarina, L1, W1, N1],[lizzie, L2, W2, N2],[mona, L3, W3, N3],[anthony, L4, W4, N4],[daniel, L5, W5, N5],[jaime, L6, W6, N6]],
	
	% we know that the name combo lizzie & osborne impossible
	not_in([lizzie, osborne, _, _], Fin),
	not_in([lizzie, _, pricenet.com, _], Fin),
	not_in([_, osborne, pricenet.com, _], Fin),
	
	% we know that name combo zickerman & caterina impossible
	not_in([caterina, zickerman, _, _], Fin),
	member([caterina, _, netvue.com, _], Fin)
	
	% we know that name combo mona & wolverton impossible & they're neighbors
	not_in([mona, wolverton, _, _], Fin),
	not_in([_, wolverton, netvue.com, _], Fin),
	not_in([mona, _, netvue.com, _], Fin),
	
	% kim & banana.com combo impossible
	not_in([_, kim, bananas.com, _], Fin),
	
	% jaime & tsuji cannot have univmoose.edu
	not_in([_, tsuji, univmoose.edu, _], Fin),
	not_in([jaime, _, univmoose.edu, _], Fin),
	
	% tsuji is a woman
	not_in([anthony, _, _, _], Fin),
	not_in([jaime, _, _, _], Fin),
	not_in([daniel, _, _, _], Fin),
	
	% bananas has a woman admin
	not_in([anthony, _, bananas.com, _], Fin),
	not_in([jaime, _, bananas.com, _], Fin),
	not_in([daniel, _, bananas.com, _], Fin),
	
	% jaime & anthony with lname elby impossible
	not_in([jaime, elby, _, _], Fin),
	not_in([anthony, elby, _, _], Fin),
	
	lname(L1), lname(L2), lname(L3), lname(L4), lname(L5), lname(L6),
	website(W1), website(W2), website(W3), website(W4), website(W5), website(W6),
	num(N1), num(N2), num(N3), num(N4), num(N5), num(N6),
	
	uniq_sys(Fin).

%solve_and_print :-

%%%%% SECTION: trip
%%%%% Below, you should define rules for the predicate "trip", which takes in 
%%%%% two computer systems and returns the list of locations in between them.
%%%%% The signature of this predicate is trip(From,To,Path)

trip(Origin, Origin, [H | []]) :-
	Origin = H.

trip(Origin, Destination, [H, T|[]]) :-
	Origin \= Destination,
	Origin = H,
	Destination = T.

trip(Origin, Destination, [H, I|T]) :-
	Origin \= Destination,
	I \= Destination,
	Origin = H,
	Origin > Destination,
	Origin = 5,
	Destination \= 4,
	Intermediate is Origin - 2,
	Intermediate = I,
	trip(I, Destination, [I|T]).

trip(Origin, Destination, [H, I|T]) :-
	Origin \= Destination,
	I \= Destination,
	Origin = H,
	Origin > Destination,
	Intermediate is Origin - 1,
	Intermediate = I,
	trip(I, Destination, [I|T]).

trip(Origin, Destination, [H, I|T]) :-
	Origin \= Destination,
	I \= Destination,
	Origin = H,
	Origin < Destination,
	Origin = 3,
	Destination \= 4,
	Intermediate is Origin + 2,
	Intermediate = I,
	trip(I, Destination, [I|T]).

trip(Origin, Destination, [H, I|T]) :-
	Origin \= Destination,
	I \= Destination,
	Origin = H,
	Origin < Destination,
	Intermediate is Origin + 1,
	Intermediate = I,
	trip(I, Destination, [I|T]).