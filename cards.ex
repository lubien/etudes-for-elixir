defmodule Cards do
  @suits ["Clubs", "Diamonds", "Hearts", "Spades"]
  @values ["A"] |> Enum.concat(2..10) |> Enum.concat(["J", "Q", "K"])

  def make_deck() do
    for value <- @values, suit <- @suits, do: {value, suit}
  end
end
