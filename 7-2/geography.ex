defmodule Geography do
  def make_geo_list(filename \\ "fixtures/geography.csv") do
    case File.read filename do
      {:ok, file} -> handle_geo_list file
      error -> error
    end
  end

  defp handle_geo_list(list) do
    list
      |> String.strip
      |> String.split("\n")
      |> Enum.map(&(String.split(&1, ",")))
      |> Enum.map(&parse_struct/1)
      |> parse_geo_list([])
  end

  defp parse_geo_list([], acc), do: acc
  defp parse_geo_list([%Country{} = country | tail], acc) do
    parse_geo_list(tail, [country | acc])
  end
  defp parse_geo_list([city | tail], [country | other_countries]) do
    IO.inspect Map.get(country, :cities)

    updated_country =
      %{country | cities: [city | Map.get(country, :cities)]}

    parse_geo_list(tail, [updated_country | other_countries])
  end

  defp parse_struct(list) do
    if Enum.count(list) == 2 do
      parse_country list
    else
      parse_city list
    end
  end

  defp parse_country([name, language]) do
    %Country{name: name, language: language, cities: []}
  end

  defp parse_city([name, population, latitude, longitude]) do
    %City{name: name, population: population, latitude: latitude, longitude: longitude}
  end
end

defmodule Country do
  defstruct name: "", language: "", cities: []
end

defmodule City do
  defstruct name: "", population: 0, latitude: 0, longitude: 0
end
