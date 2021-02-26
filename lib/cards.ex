defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings represting a deck of playing cards
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def hand({hand, _restOfDeck}) do
    hand
  end

  @doc """
    Divides the deck into a hand and teh remainder of the deck. The `handSize` argument indicates how many cards should be in a hand.

  ## Examples
    
      iex> deck = Cards.createDeck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
    |> hand
  end

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)
    File.write(fileName, binary)
  end

  def load(fileName) do
    case File.read(fileName) do
      {:ok, binary}-> :erlang.binary_to_term binary
      {:error, _reason} -> "No such file found!"
    end
  end

  def createHand(handSize) do
    createDeck
    |> shuffle
    |> deal(handSize)
  end
end
