defmodule Dates do
  @days_per_month [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def date_parts(iso), do: iso
      |> String.split("-")
      |> Enum.map(&(String.to_integer &1))

  def julian(iso) do
    [year, month, day] = date_parts(iso)

    total = day + (
      @days_per_month |> Enum.split(month - 1) |> elem(0) |> Enum.reduce(&(&1 + &2))
    )

    if is_leap_year(year) and month > 2 do
      total + 1
    else
      total
    end
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end
end
