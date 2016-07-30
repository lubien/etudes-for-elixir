defmodule Geom do
  def area(:rectangle, height, width), do: height * width

  def area(:triangle, base, height), do: base * height / 2

  def area(:ellipse, major, minor), do: :math.pi() * major * minor
end
