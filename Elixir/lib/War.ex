# Asher Andargachew
# CPS 506
# 501101885

defmodule War do
  @moduledoc """
    Documentation for `War`.
  """

  @doc """
    Function stub for deal/1 is given below. Feel free to add
    as many additional helper functions as you want.

    The tests for the deal function can be found in test/war_test.exs.
    You can add your five test cases to this file.

    Run the tester by executing 'mix test' from the war directory
    (the one containing mix.exs)
  """

  # give the player their hand by giving every other card depending on the player
  def getPlayerCards(deck, player) do
    if player == 1 do
      getPlayerCards(tl(tl(deck)), player, [hd(deck)])
    else
      getPlayerCards(tl(tl(deck)), player, [hd(tl(deck))])
    end
  end

  # when the deck is empty return the player hand
  def getPlayerCards([], _player, playerHand), do: playerHand

  def getPlayerCards(deck, player, playerHand) do
    # player 1's hand
    if player == 1 do
      playerHand = [hd(deck)] ++ playerHand
      getPlayerCards(tl(tl(deck)), player, playerHand)
    else
      # player 2's hand
      playerHand = [hd(tl(deck))] ++ playerHand
      getPlayerCards(tl(tl(deck)), player, playerHand)
    end
  end

  # deal cards by calling the getPlayerCards function for player 1 and player 2
  def deal(shuf) do
    player1 = getPlayerCards(shuf, 1)
    player2 = getPlayerCards(shuf, 2)

    # play the game
    play(player1, player2)
  end

  # during a tie just return the warchest to the play function
  def gotoWar([], [], warchest), do: play(warchest, [])

  # player 1 wins during war
  def gotoWar(p1, [], warchest), do: play(p1 ++ warchest, [])

  # player 2 wins during war
  def gotoWar([], p2, warchest), do: play([], p2 ++ warchest)

  # when a war occurs
  def gotoWar(p1, p2, warchest) do
    # my sort function to ensure 1(A) is the biggest number
    mySort = fn
      a when a == 1 -> "A"
      a -> a
    end

    # get top cards
    p1First = hd(p1)
    p2First = hd(p2)

    # when the length of the lists are 2 or greater
    if p1First == p2First and length(p1) >= 2 and length(p2) >= 2 do
      warchest = warchest ++ [p1First, p2First, hd(tl(p1)), hd(tl(p2))]
      gotoWar(tl(tl(p1)), tl(tl(p2)), Enum.sort_by(warchest, &mySort.(&1), :desc))
    else
      # when the length of the lists are 1
      if p1First == p2First and (length(p1) == 1 or length(p2) == 1) do
        warchest = warchest ++ [p1First, p2First]
        gotoWar(tl(p1), tl(p2), Enum.sort_by(warchest, &mySort.(&1), :desc))
      else
        # add top cards to warchest
        warchest = warchest ++ [p1First, p2First]

        # normal card comparison, player with bigger number wins
        if (p1First > p2First and p2First != 1) or p1First < 2 do
          play(tl(p1) ++ Enum.sort_by(warchest, &mySort.(&1), :desc), tl(p2))
        else
          play(tl(p1), tl(p2) ++ Enum.sort_by(warchest, &mySort.(&1), :desc))
        end
      end
    end
  end

  # player 1 wins
  def play(p1, []), do: p1

  # player 2 wins
  def play([], p2), do: p2

  # play the game with 2 players
  def play(p1, p2) do
    # take the top cards
    p1First = hd(p1)
    p2First = hd(p2)

    # war occured
    if p1First == p2First do
      gotoWar(p1, p2, [])
    else
      # when player 1 draws higher
      if (p1First > p2First and p2First != 1) or p1First == 1 do
        play(tl(p1) ++ [p1First, p2First], tl(p2))
      else
        # when player 2 draws higher
        play(tl(p1), tl(p2) ++ [p2First, p1First])
      end
    end
  end
end
