% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Khushi Chowdhury
%%%%% NAME: Asher Andargachew
%%%%% NAME:	Wathaned Ean
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: articleAuthor
% Put your atomic statements for the articleAuthor predicate in this section

articleAuthor(spongebob_analysis, khushi_chowdhury).
articleAuthor(spongebob_analysis, asher_andargachew).
articleAuthor(disco_elysium_and_dialog, wathaned_ean).
articleAuthor(disco_elysium_and_dialog, derrick_yu).
articleAuthor(disco_elysium_and_dialog, ian_chow).
articleAuthor(utena_and_the_meaning_of_fate, wathaned_ean).
articleAuthor(nim_is_king, array).
articleAuthor(ai_will_destroy_everything, array).
articleAuthor(ai_will_destroy_everything, derrick_yu).
articleAuthor(kirby_cuteness, nada_eissar).
articleAuthor(kirby_cuteness, khushi_chowdhury).
articleAuthor(ufkes_goated, khushi_chowdhury).
articleAuthor(ufkes_goated, asher_andargachew).
articleAuthor(ufkes_goated, wathaned_ean).
articleAuthor(lifting_for_babies, ian_naunheimer).
articleAuthor(lifting_for_babies, abishaath).
articleAuthor(lifting_for_babies, asher_andargachew).
articleAuthor(looksmaxxing, abishaath).
articleAuthor(art_of_boba, kim).
articleAuthor(art_of_boba, wathaned_ean).
articleAuthor(subaru_is_life, vathana).
articleAuthor(subaru_is_life, kim).
articleAuthor(learning_amharic, asher_andargachew).
articleAuthor(learning_amharic, kadoose).
articleAuthor(robots_are_cool, kadoose).
articleAuthor(how_to_rizz_up_ai, abishaath).


%%%%% SECTION: articleTopic
% Put your atomic statements for the articleTopic predicate in this section

articleTopic(spongebob_analysis, cartoon).
articleTopic(spongebob_analysis, tv).
articleTopic(spongebob_analysis, analysis).
articleTopic(disco_elysium_and_dialog, video_game).
articleTopic(disco_elysium_and_dialog, analysis).
articleTopic(utena_and_the_meaning_of_fate, anime).
articleTopic(utena_and_the_meaning_of_fate, tv).
articleTopic(nim_is_king, programming).
articleTopic(nim_is_king, guide).
articleTopic(ai_will_destroy_everything, ai).
articleTopic(ai_will_destroy_everything, analysis).
articleTopic(kirby_cuteness, cartoon).
articleTopic(kirby_cuteness, aesthetic).
articleTopic(ufkes_goated, programming).
articleTopic(ufkes_goated, school).
articleTopic(ufkes_goated, teaching).
articleTopic(lifting_for_babies, exercise).
articleTopic(lifting_for_babies, guide).
articleTopic(looksmaxxing, guide).
articleTopic(looksmaxxing, aesthetic).
articleTopic(looksmaxxing, romance).
articleTopic(art_of_boba, food).
articleTopic(art_of_boba, aesthetic).
articleTopic(subaru_is_life, cars).
articleTopic(subaru_is_life, analysis).
articleTopic(learning_amharic, language).
articleTopic(learning_amharic, teaching).
articleTopic(robots_are_cool, robots).
articleTopic(robots_are_cool, ai).
articleTopic(how_to_rizz_up_ai, ai).
articleTopic(how_to_rizz_up_ai, guide).
articleTopic(how_to_rizz_up_ai, romance).


%%%%% SECTION: collabDist
% Put your rules for collabDist in this section

collabDist(Author, Author, MaxDist) :-
	MaxDist >= 0,
	articleAuthor(Article, Author).
	
collabDist(Author1, Author2, MaxDist) :-
	MaxDist > 0,
	N is MaxDist-1,
	articleAuthor(Article, Author1),
	articleAuthor(Article, Collaborator),
	Collaborator \= Author1,
	collabDist(Author2, Collaborator, N).

%%%% SECTION: collabDistWithAI
% Put your rules for collabDistWithAI in this section

collabDistWithAI(Author, Author, MaxDist, none) :-
	MaxDist >= 0,
	articleAuthor(Article, Author),
	\+ (articleTopic(Article, ai)).
	
collabDistWithAI(Author, Author, MaxDist, at_least_one) :-
	MaxDist >= 0,
	articleAuthor(Article, Author),
	articleTopic(Article, ai).

collabDistWithAI(Author1, Author2, MaxDist, none) :-
	MaxDist > 0,
	N is MaxDist-1,
	Author1 \= Author2,
	articleAuthor(Article, Author1),
	articleAuthor(Article, Collaborator),
	Collaborator \= Author1,
	collabDist(Author2, Collaborator, N),
	articleTopic(Article, ArticleTopic),
	\+ (ArticleTopic = ai),
	collabDistWithAI(Author2, Collaborator, N, none).
	
collabDistWithAI(Author1, Author2, MaxDist, at_least_one) :-
	MaxDist > 0,
	N is MaxDist-1,
	articleAuthor(Article, Author1),
	articleAuthor(Article, Collaborator),
	Collaborator \= Author1,
	collabDist(Author2, Collaborator, N),
	articleTopic(Article, ai),
	collabDist(Author2, Collaborator, N).

collabDistWithAI(Author1, Author2, MaxDist, at_least_one) :-
	MaxDist > 0,
	N is MaxDist-1,
	articleAuthor(Article, Author1),
	articleAuthor(Article, Collaborator),
	Collaborator \= Author1,
	collabDist(Author2, Collaborator, N),
	articleTopic(Article, ArticleTopic),
    ArticleTopic \= ai,
	collabDistWithAI(Author2, Collaborator, N, at_least_one).