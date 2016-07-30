defmodule Geom do
  def area({shape, x, y}), do: area(shape, x, y)

  defp area(:rectangle, height, width) when height >= 0 and width >= 0,
    do: height * width

  defp area(:triangle, base, height) when base >= 0 and height >= 0,
    do: base * height / 2

  defp area(:ellipse, major, minor) when major >= 0 and minor >= 0,
    do: :math.pi() * major * minor

  defp area(_shape, _x, _y), do: 0
end
