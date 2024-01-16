#![allow(non_snake_case, non_camel_case_types, dead_code)]

/*
    Asher Andargachew
    501101885

    Below is the function stub for deal. Add as many helper functions
    as you like, but the deal function should not be modified. Just
    fill it in.

    Test your code by running 'cargo test' from the war_rs directory.
*/
use std::cmp::Ordering;

// deal cards to both players
fn deal(shuf: &[u8; 52]) -> [u8; 52] {
    let mut player1: Vec<u8> = vec![];
    let mut player2: Vec<u8> = vec![];

    let mut winner: [u8; 52] = [0; 52];

    // deals deck alternating between players in reverse
    // this will make the last two cards in the deck the first cards in the player's hand
    for i in (0..shuf.len()).rev().step_by(2) {
        player1.push(shuf[i]);
        player2.push(shuf[i - 1]);
    }

    // play the game
    // get winning deck order
    let result: Vec<u8> = play(&mut player1, &mut player2);

    // add it to an array type winner
    for i in 0..result.len() {
        winner[i] = result[i];
    }

    // return winning hand
    winner
}

// this is where the game is played
fn play(player1: &mut Vec<u8>, player2: &mut Vec<u8>) -> Vec<u8> {
    // player 1 wins
    if player2.len() == 0 {
        return player1.to_vec();
    }

    // player 2 wins
    if player1.len() == 0 {
        return player2.to_vec();
    }

    // take top cards
    let p1_first = player1[0];
    let p2_first = player2[0];

    // war occured
    if p1_first == p2_first {
        let mut warchest: Vec<u8> = vec![];
        go_to_war(player1, player2, &mut warchest)
    } else if (p1_first > p2_first && p2_first != 1) || p1_first == 1 {
        // player one has the bigger card

        // push to the bottom of the deck
        player1.push(p1_first);
        player1.push(p2_first);

        player1.remove(0);
        player2.remove(0);

        println!("Player1 play p1 wins {:?}", player1);
        println!("Player2 play p1 wins {:?}", player2);

        // go through play again
        play(player1, player2)
    } else {
        // same as above but player 2 is bigger
        player2.push(p2_first);
        player2.push(p1_first);

        player1.remove(0);
        player2.remove(0);

        println!("Player1 play p2 wins {:?}", player1);
        println!("Player2 play p2 wins {:?}", player2);

        play(player1, player2)
    }
}

// war section of the game
fn go_to_war(player1: &mut Vec<u8>, player2: &mut Vec<u8>, warchest: &mut Vec<u8>) -> Vec<u8> {
    // A tie has occured, just return the warchest to the play function
    if player1.len() == 0 && player2.len() == 0 {
        warchest.to_vec()
    } else if player1.len() == 0 {
        //Player 1 runs out of cards
        player2.append(warchest);
        player2.to_vec()
    } else if player2.len() == 0 {
        //Player 2 runs out of cards
        player1.append(warchest);
        player1.to_vec()
    } else {
        // take first top cards
        let p1_first = player1[0];
        let p2_first = player2[0];

        // add them to the warchest and remove them from each player's deck
        warchest.push(p1_first);
        player1.remove(0);

        warchest.push(p2_first);
        player2.remove(0);

        // sort warchest
        warchest.sort_by(|&a, &b| match (a == 1, b == 1) {
            (true, true) => Ordering::Equal,
            (true, false) => Ordering::Less,
            (false, true) => Ordering::Greater,
            (false, false) => b.cmp(&a),
        });

        // when the length of the lists are 1 or greater
        if p1_first == p2_first && player1.len() >= 1 && player2.len() >= 1 {
            warchest.push(player1[0]);
            player1.remove(0);

            warchest.push(player2[0]);
            player2.remove(0);

            warchest.sort_by(|&a, &b| match (a == 1, b == 1) {
                (true, true) => Ordering::Equal,
                (true, false) => Ordering::Less,
                (false, true) => Ordering::Greater,
                (false, false) => b.cmp(&a),
            });

            go_to_war(player1, player2, warchest)
        } else if p1_first == p2_first && (player1.len() == 0 || player2.len() == 0) {
            // when the length of one of the lists is 0

            warchest.sort_by(|&a, &b| match (a == 1, b == 1) {
                (true, true) => Ordering::Equal,
                (true, false) => Ordering::Less,
                (false, true) => Ordering::Greater,
                (false, false) => b.cmp(&a),
            });

            go_to_war(player1, player2, warchest)
        } else {
            if (p1_first > p2_first && p2_first != 1) || p1_first < 2 {
                // add warchest to player 1 who won the war
                player1.append(warchest);

                println!("Player1 war p1 wins {:?}", player1);
                println!("Player2 war p1 wins {:?}", player2);

                play(player1, player2)
            } else {
                // add warchest to player 2 who won the war
                player2.append(warchest);

                println!("Player1 war p2 wins {:?}", player1);
                println!("Player2 war p2 wins {:?}", player2);

                play(player1, player2)
            }
        }
    }
}

#[cfg(test)]
#[path = "tests.rs"]
mod tests;
