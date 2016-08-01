defmodule NonFP do
  def generate_pockets(list, prob) do
    generate_pockets(list, prob, [])
  end

  defp generate_pockets([], _, acc), do: Enum.reverse(acc)
  defp generate_pockets(['F' | tail], prob, acc) do
    generate_pockets(tail, prob, [[0] | acc])
  end
  defp generate_pockets([_ | tail], prob, acc) do
    generate_tooth(tail, prob, [generate_tooth(prob) | acc])
  end

  defp generate_tooth(prob) do
    if :rand.uniform() < prob do 2 else 3 end
      |> generate_tooth(6, [])
  end

  defp generate_tooth(_, items_left, acc) when items_left < 1, do: acc
  defp generate_tooth(base_depth, items_left, acc) do
    generate_tooth(base_depth, items_left - 1, [base_depth + (:rand.uniform(3) - 2) | acc])
  end
end
