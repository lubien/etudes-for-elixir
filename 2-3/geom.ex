defmodule Geom do
  @moduledoc """
  Provides geometrial helpers

  ## Examples

    iex> Geom.area 2, 3

    6

  """

  """
  Calculates the area based on a height and a width
  """
  def area(height \\ 1, width \\ 1) do
    height * width
  end
end
