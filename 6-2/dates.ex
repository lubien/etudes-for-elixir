defmodule Dates do
  @days_per_month [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def date_parts(iso), do: iso
      |> String.split("-")
      |> Enum.map(&(String.to_integer &1))

  def julian(iso) do
    [year, month, day] = date_parts(iso)

    total = month_total(month, @days_per_month, day)

    if is_leap_year(year) and month > 2 do
      total + 1
    else
      total
    end
  end

  defp month_total(1, _, acc), do: acc
  defp month_total(month, [hd_month | tl_months], acc) do
    month_total(month - 1, tl_months, acc + hd_month)
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end
end
