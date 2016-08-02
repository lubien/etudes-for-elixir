defmodule Calculus do
  def derivative(f, x) do
    delta = 1.0e-10

    (f.(x + delta) - f.(x)) / delta
  end
end
