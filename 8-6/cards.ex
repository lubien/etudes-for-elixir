defmodule Cards do
  @suits ["Clubs", "Diamonds", "Hearts", "Spades"]
  @values ["A"] |> Enum.concat(2..10) |> Enum.concat(["J", "Q", "K"])

  def make_deck() do
    for value <- @values, suit <- @suits, do: {value, suit}
  end

  @doc """
  Given a list of cards in the form {"A", "Clubs"}, shuffle it
  """
  @spec shuffle(tuple) :: [tuple]

  def shuffle(list) do
    :rand.seed(:erlang.now())
    shuffle(list, [])
  end

  # Helper function to shuffle a deck

  @doc """
  When our shuffling is done, return the shuffled deck (acc)
  """
  @spec shuffle([], [tuple]) :: [tuple]

  def shuffle([], acc) do
    acc
  end

  @doc """
  Split our list by a random number of cards. Call the first part "leading" and split
  the others into "h" head and "t" tail.
  Put "h" into the shuffled accumulator (acc) then shuffle leading ++ t
  """
  @spec shuffle([tuple], []) :: [tuple]

  def shuffle(list, acc) do
    {leading, [h | t]} =
      Enum.split(list, :rand.uniform(Enum.count(list)) - 1)

    shuffle(leading ++ t, [h | acc])
  end
end
