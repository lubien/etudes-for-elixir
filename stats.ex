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
end
