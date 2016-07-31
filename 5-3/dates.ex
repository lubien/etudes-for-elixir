defmodule Dates do
  def date_parts(iso), do: iso
      |> String.split("-")
      |> Enum.map &(String.to_integer &1)
end
