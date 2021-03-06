defmodule Geom do
  def area(:rectangle, height, width) when height >= 0 and width >= 0,
    do: height * width

  def area(:triangle, base, height) when base >= 0 and height >= 0,
    do: base * height / 2

  def area(:ellipse, major, minor) when major >= 0 and minor >= 0,
    do: :math.pi() * major * minor

  def area(_shape, _x, _y), do: 0
end
