defmodule Stats do
  def minimum([head | tail]), do: minimum(tail, head)

  defp minimum([], acc), do: acc
  defp minimum([head | tail], acc) do
    if head < acc do head else acc end
      |> (&minimum(tail, &1)).()
  end

  def maximum([head | tail]), do: maximum(tail, head)

  defp maximum([], acc), do: acc
  defp maximum([head | tail], acc) do
    if head > acc do head else acc end
      |> (&maximum(tail, &1)).()
  end

  def range(list), do: [minimum(list), maximum(list)]

  def mean(list), do: Enum.reduce(list, &(&1 + &2)) / Enum.count(list)

  def stdv(list) do
    n = Enum.count list
    {sum, sum_of_squares} = list
      |> Enum.reduce({0, 0}, fn (x, {acc, acc_sos}) -> {acc + x, acc_sos + x * x} end)

    :math.sqrt(
      (sum_of_squares * n - sum * sum) / (n * (n - 1))
    )
  end
end
