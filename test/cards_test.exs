defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "createDeck makes 20 cards" do
    deckLength = length(Cards.createDeck)
    assert deckLength == 20
  end

  test "shuffling a deck randomises it" do
    deck = Cards.createDeck
    # assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end
end
