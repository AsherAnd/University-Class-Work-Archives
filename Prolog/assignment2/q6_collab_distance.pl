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

%% To help you test your collabDistance, you may put your knowledge base below. Do not put it under the colladDistance
%% section. You may also delete your test knowledge based before submission, as we will not be marking it


%%%%% SECTION: collabDistance
%%%%% Predicate definition: collabDist(Author1, Author2, MaxDist, Authors, Articles)

articleAuthor(spongebob_analysis, [khushi_chowdhury, asher_andargachew]).
articleAuthor(disco_elysium_and_dialog, [wathaned_ean, derrick_yu, ian_chow]).
articleAuthor(utena_and_the_meaning_of_fate, [wathaned_ean]).
articleAuthor(nim_is_king, [array]).
articleAuthor(ai_will_destroy_everything, [array, derrick_yu]).
articleAuthor(kirby_cuteness, [nada_eissar, khushi_chowdhury]).
articleAuthor(ufkes_goated, [khushi_chowdhury, asher_andargachew, wathaned_ean]).
articleAuthor(lifting_for_babies, [ian_naunheimer, abishaath, asher_andargachew]).
articleAuthor(looksmaxxing, [abishaath]).
articleAuthor(art_of_boba, [kim, wathaned_ean]).
articleAuthor(subaru_is_life, [vathana, kim]).
articleAuthor(learning_amharic, [asher_andargachew, kadoose]).
articleAuthor(robots_are_cool, [kadoose]).
articleAuthor(how_to_rizz_up_ai, [abishaath]).

% Base case:
collabDist(Author1, Author2, 0, [], []) :-
    Author1 = Author2.

% Recursive code: 
collabDist(Author1, Author2, MaxDist, [Author1 | Autail], [Article | Artail]) :-
    MaxDist >= 1,
    articleAuthor(Article, Authors),
    member(Author1, Authors),
    member(Collaborator, Authors),
    Author1 \= Collaborator,
    MaxDist2 is MaxDist - 1,
    collabDist(Collaborator, Author2, MaxDist2, Autail, Artail).