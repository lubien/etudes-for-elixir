defmodule AskArea do
  def area() do
    shape = 'R)ectangle, T)riangle, or E)llipse: '
      |> IO.gets
      |> char_to_shape

    {dim1, dim2} = case shape do
      :rectangle -> get_dimensions "Width", "Height"
      :triangle -> get_dimensions "Base", "Height"
      :ellipse -> get_dimensions "Major radius", "Minor readius"
      :unknown -> IO.puts "Unknown shape"
    end

    case calculate shape, dim1, dim2 do
      {:ok, r} -> IO.puts r
      {:error, err} -> IO.puts err
    end
  end

  defp calculate(shape, x, y) do
    cond do
      shape === :unknown -> {:error, "Unknown shape"}
      x < 0 or y < 0 -> {:error, "Invalid negative parameters"}
      true -> {:ok, Geom.area(shape, x, y)}
    end
  end

  defp char_to_shape(char) do
    case char |> String.first |> String.upcase do
      "R" -> :rectangle
      "T" -> :triangle
      "E" -> :ellipse
      _ -> :unknown
    end
  end

  defp get_number(prompt) do
    "Enter #{prompt} > "
      |> IO.gets
      |> String.strip
      |> String.to_integer
  end

  defp get_dimensions(a, b) do
    [a, b]
      |> Enum.map(&get_number(&1))
      |> List.to_tuple
  end
end
