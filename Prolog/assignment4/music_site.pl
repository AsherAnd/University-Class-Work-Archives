
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

%%%%% SECTION: constants
%%%%% You do not have to add anything to this section, but feel free to change the currentYear value to test your program

orderNames([first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, 
            eleventh, twelfth, thirteenth, fourteenth, fifteenth, sixteenth, seventeenth, eighteenth, nineteenth, twentytieth]).

currentYear(2023).

%%%%% SECTION: database
%%%%% Put statements for albumArtist, albumYear, albumGenre, and trackList below

albumArtist(damn, kendrick_lamar).

albumArtist(death_race_for_love, juice_wrld).

albumArtist(born_sinner, j_cole).

albumArtist(good_kid_maad_city, kendrick_lamar).

albumArtist(forest_hill_drive, j_cole).

albumArtist(nekoto_allergie, kinoko_teikoku).

albumArtist(strangers, fizzy_blood).

albumArtist(all_i_can_say, cbs).

albumArtist(rtj4, run_the_jewels).

albumArtist(trilogy, carpenter_brut).

albumArtist(sremmlife, rae_sremmurd).

albumArtist(to_hell_with_it, pinkpantheress).

albumArtist(american_teen, khalid).

albumArtist(euphoria, labrinth).

albumArtist(starboy, the_weeknd).



albumLabel(damn, top_dawg_entertainment).

albumLabel(death_race_for_love, grade_a).

albumLabel(born_sinner, dreamville_records).

albumLabel(good_kid_maad_city, top_dawg_entertainment).

albumLabel(forest_hill_drive, dreamville_records).

albumLabel(nekoto_allergie, uk_project).

albumLabel(strangers, wathaned_entertainment).

albumLabel(all_i_can_say, wathaned_entertainment).

albumLabel(rtj4, bmg).

albumLabel(trilogy, no_quarter_prod).

albumLabel(sremmlife, ear_drummer_records).

albumLabel(to_hell_with_it, parlophone).

albumLabel(american_teen, right_hand_music_group).

albumLabel(euphoria, columbia_records).

albumLabel(starboy, republic_records).



albumYear(damn, 2017).

albumYear(death_race_for_love, 2019).

albumYear(born_sinner, 2013).

albumYear(good_kid_maad_city, 2012).

albumYear(forest_hill_drive, 2014).

albumYear(nekoto_allergie, 2015).

albumYear(strangers, 2018).

albumYear(all_i_can_say, 2022).

albumYear(rtj4, 2020).

albumYear(trilogy, 2015).

albumYear(sremmlife, 2015).

albumYear(to_hell_with_it, 2021).

albumYear(american_teen, 2017).

albumYear(euphoria, 2022).

albumYear(starboy, 2016).



albumGenre(damn, hip_hop).

albumGenre(death_race_for_love, hip_hop).

albumGenre(born_sinner, hip_hop).

albumGenre(good_kid_maad_city, hip_hop).

albumGenre(forest_hill_drive, hip_hop).

albumGenre(nekoto_allergie, alternative_rock).

albumGenre(strangers, alternative_rock).

albumGenre(all_i_can_say, pop).

albumGenre(rtj4, hip_hop).

albumGenre(trilogy, synthwave).

albumGenre(sremmlife, hip_hop).

albumGenre(to_hell_with_it, electronic).

albumGenre(american_teen, rnb).

albumGenre(euphoria, electronic).

albumGenre(starboy, rnb).



trackList(damn, [song(blood, 177), song(dna, 223), song(yah, 214)]).

trackList(death_race_for_love, [song(empty, 109), song(maze, 218), song(heMotions, 229)]).

trackList(born_sinner, [song(villuminati, 271), song(land_of_the_snakes, 277), song(power_trip, 414)]).

trackList(good_kid_maad_city, [song(sherane, 289), song(bitch_dont_kill_my_vibe, 322), song(backseat_freestyle, 213)]).

trackList(forest_hill_drive, [song(intro, 144), song(january_28th, 210), song(wet_dreamz, 240)]).

trackList(nekoto_allergie, [song(nekoto, 276), song(andromeda, 318), song(she, 246)]).

trackList(strangers, [song(immersion, 203), song(panic, 236), song(heal, 205)]).

trackList(all_i_can_say, [song(walk, 150), song(lost, 189), song(sunshine, 195)]).

trackList(rtj4, [song(yankee_and_the_brave, 154), song(ooh_la_la, 204), song(out_of_sight, 217)]).

trackList(trilogy, [song(synthwave1, 189), song(synthwave2, 222), song(synthwave3, 197)]).

trackList(sremmlife, [song(lit_like_bic, 290), song(unlock_the_swag, 251), song(no_type, 287)]).

trackList(to_hell_with_it, [song(u_like_the_way_i_dance, 120), song(i_must_ache, 178), song(just_for_me, 191)]).

trackList(american_teen, [song(american_teen, 221), song(young_dumb_and_broke, 200), song(location, 210)]).

trackList(euphoria, [song(euphoria_theme, 132), song(fade_away, 225), song(for_a_feeling, 224)]).

trackList(starboy, [song(starboy, 231), song(partition_rockin, 227), song(reminder, 230)]).



%%%%% SECTION: helpers
%%%%% Add the predicates isSong(Song), songLength(Song, Length), onAlbum(Song, Album), albumLength(Album, Length), and atNamedIndex(List, Entry, Element)
%%%%% Another other helper predicates you wish to add for your lexicon or the parser should be added here

isSong(Song) :-
	trackList(_, List),
	member(song(Song, _), List).

songLength(Song, Length) :-
	trackList(_, List),
	member(song(Song, Length), List).

onAlbum(Song, Album) :-
	trackList(Album, List),
	member(song(Song, _), List).

listSum([], 0).

listSum([song(_, SongLength)], SongLength).

listSum([song(_, SongLength1) | T], SongLength) :-
	listSum(T, SongLengthT),
	SongLength is SongLength1 + SongLengthT.

albumLength(Album, Length) :-
	trackList(Album, List),
	listSum(List, Length).

prevEleHelper([Prev, Element | _], Element, Prev).

prevEleHelper([_| Tail], Element, Prev) :-
	prevEleHelper(Tail, Element, Prev).

prevEle(List, Element, Prev) :-
	prevEleHelper(List, Element, Prev).

atNamedIndex([Element], first, Element).

atNamedIndex([Element | _], first, Element).

atNamedIndex([_ | T], Entry, Element) :-
	orderNames(X),
	member(Entry, X),
	member(Prev, X),
	prevEle(X, Entry, Prev),
	atNamedIndex(T, Prev, Element).


%%%%% SECTION: articles
%%%%% Put the rules/statements defining the proper_nouns below

article(a).

article(an).

article(the).

article(any).


%%%%% SECTION: proper_nouns
%%%%% Put the rules/statements defining the proper_nouns below

proper_noun(kendrick_lamar).

proper_noun(juice_wrld).

proper_noun(j_cole).

proper_noun(kinoko_teikoku).

proper_noun(fizzy_blood).

proper_noun(cbs).

proper_noun(run_the_jewels).

proper_noun(carpenter_brut).

proper_noun(rae_sremmurd).

proper_noun(pinkpantheress).

proper_noun(khalid).

proper_noun(labrinth).

proper_noun(the_weeknd).

proper_noun(damn).

proper_noun(death_race_for_love).

proper_noun(born_sinner).

proper_noun(good_kid_maad_city).

proper_noun(forest_hill_drive).

proper_noun(nekoto_allergie).

proper_noun(strangers).

proper_noun(all_i_can_say).

proper_noun(rtj4).

proper_noun(trilogy).

proper_noun(sremmlife).

proper_noun(to_hell_with_it).

proper_noun(american_teen).

proper_noun(euphoria).

proper_noun(starboy).

proper_noun(blood).

proper_noun(dna).

proper_noun(yah).

proper_noun(empty).

proper_noun(maze). 

proper_noun(heMotions).

proper_noun(villuminati). 

proper_noun(land_of_the_snakes).

proper_noun(power_trip).

proper_noun(sherane). 

proper_noun(bitch_dont_kill_my_vibe). 

proper_noun(backseat_freestyle).

proper_noun(intro).

proper_noun(january_28th).

proper_noun(wet_dreamz).

proper_noun(nekoto).

proper_noun(andromeda).

proper_noun(she).

proper_noun(immersion).

proper_noun(panic).

proper_noun(heal).

proper_noun(walk).

proper_noun(lost).

proper_noun(sunshine).

proper_noun(yankee_and_the_brave).

proper_noun(ooh_la_la).

proper_noun(out_of_sight).

proper_noun(synthwave1).

proper_noun(synthwave2).

proper_noun(synthwave3).

proper_noun(lit_like_bic).

proper_noun(unlock_the_swag).

proper_noun(no_type).

proper_noun(u_like_the_way_i_dance).

proper_noun(i_must_ache).

proper_noun(just_for_me).

proper_noun(american_teen).

proper_noun(young_dumb_and_broke).

proper_noun(location).

proper_noun(euphoria_theme).

proper_noun(fade_away).

proper_noun(for_a_feeling).

proper_noun(starboy).

proper_noun(partition_rockin).

proper_noun(reminder).

proper_noun(2017).
proper_noun(2019).
proper_noun(2013).
proper_noun(2012).
proper_noun(2014).
proper_noun(2015).
proper_noun(2018).
proper_noun(2022).
proper_noun(2020).
proper_noun(2021).
proper_noun(2016).

proper_noun(177). 
proper_noun(223).
proper_noun(214).
proper_noun(109). 
proper_noun(218). 
proper_noun(229).
proper_noun(271). 
proper_noun(277). 
proper_noun(414).
proper_noun(289).
proper_noun(322).
proper_noun(213).
proper_noun(144). 
proper_noun(210). 
proper_noun(240).
proper_noun(276). 
proper_noun(318). 
proper_noun(246).
proper_noun(203).
proper_noun(236). 
proper_noun(205).
proper_noun(150).
proper_noun(189).
proper_noun(195).
proper_noun(154). 
proper_noun(204). 
proper_noun(217).
proper_noun(222).
proper_noun(197).
proper_noun(290). 
proper_noun(251). 
proper_noun(287).
proper_noun(120).
proper_noun(178). 
proper_noun(191).
proper_noun(221). 
proper_noun(200).
proper_noun(132).
proper_noun(225).
proper_noun(224).
proper_noun(231).
proper_noun(227). 
proper_noun(230).


%%%%% SECTION: common_nouns
%%%%% Put the rules/statements defining the common_nouns below

common_noun(album, X) :- albumArtist(X, _).

common_noun(artist, X) :- albumArtist(_, X).

common_noun(song, X) :- isSong(X).

common_noun(track, X) :- isSong(X).

common_noun(length, X) :- songLength(_, X).

common_noun(genre, X) :- albumGenre(_, X).

common_noun(record, X) :- albumArtist(X, _).

common_noun(release_year, X) :- albumYear(_, X).


%%%%% SECTION: adjectives
%%%%% Put the rules/statements defining the adjectives below

adjective(short, X) :-
    songLength(X, Length), 
    Length < 180.

adjective(long, X) :-
    songLength(X, Length), 
    Length >= 360.

adjective(old, X) :-
    albumYear(X, Year),
    Year < 2000.

adjective(new, X) :-
    albumYear(X, Year),
    Year is currentYear.

adjective(Genre, Album) :- 
    albumGenre(Album, Genre).

adjective(Genre, Artist) :- 
    albumGenre(Album, Genre),
    albumArtist(Album, Artist).

adjective(Genre, Song) :- 
    albumGenre(Album, Genre),
    onAlbum(Song, Album).

adjective(Artist, Album) :- 
    albumArtist(Album, Artist).

adjective(Artist, Song) :- 
    albumArtist(Album, Artist),
    onAlbum(Song, Album).

adjective(Nth, S) :-
    isSong(S),
    onAlbum(S, Album),
    trackList(Album, L),
    atNamedIndex(L, Nth, song(S, _)).


%%%%% SECTION: prepositions
%%%%% Put the rules/statements defining the prepositions below

preposition(on, Song, Album) :- onAlbum(Song, Album).

preposition(by, Song, Artist) :- onAlbum(Song, Album), albumArtist(Album, Artist).

preposition(by, Album, Artist) :- albumArtist(Album, Artist).

preposition(released_in, Song, Year) :- albumYear(Album, Year), onAlbum(Song, Album).

preposition(released_in, Album, Year) :- albumYear(Album, Year).

preposition(of, Length, Album) :- albumLength(Album, Length).

preposition(of, Length, Song) :- songLength(Song, Length).

preposition(of, Genre, Album) :- albumGenre(Album, Genre).

preposition(of, Genre, Song) :- onAlbum(Song, Album), albumGenre(Album, Genre).

preposition(of, Year, Album) :- albumYear(Album, Year).

preposition(of, Album, Length) :- albumLength(Album, Length).

preposition(of, Song, Length) :- songLength(Song, Length).

preposition(of, Album, Genre) :- albumGenre(Album, Genre).

preposition(of, Song, Genre) :- onAlbum(Song, Album), albumGenre(Album, Genre).

preposition(of, Album, Year) :- albumYear(Album, Year).

preposition(released_before, Album1, Album2) :- 
    albumYear(Album1, Year1), 
    albumYear(Album2, Year2), 
    Year1 < Year2.

preposition(released_after, Album1, Album2) :- 
    albumYear(Album1, Year1), 
    albumYear(Album2, Year2), 
    Year1 > Year2.

preposition(with, Song, Artist) :- onAlbum(Song, Album), albumArtist(Album, Artist).

preposition(with, Album, Artist) :- albumArtist(Album, Artist).

preposition(with, Song, Genre) :- onAlbum(Song, Album), albumGenre(Album, Genre).

preposition(with, Album, Genre) :- albumGenre(Album, Genre).

preposition(with, Song, Year) :- onAlbum(Song, Album), albumYear(Album, Year).

preposition(with, Album, Year) :- albumYear(Album, Year).

preposition(with, Song, Length) :- songLength(Song, Length).

preposition(with, Album, Length) :- albumLength(Album, Length).


%%%%% SECTION: PARSER
%%%%% For testing your lexicon for question 3, we will use the default parser initially given to you.
%%%%% For testing your answers for question 4, we will use your parser below

what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).


/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).

/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, What) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, What),	mods(End, What).

prepPhrase([Prep|Rest], What) :-
	preposition(Prep, What, Ref), np(Rest, Ref).

appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

