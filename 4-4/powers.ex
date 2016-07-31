defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(_, 0), do: 1
  def raise(x, n) when n > 0, do: raise(x, n, 1)
  def raise(x, n), do: 1.0 / raise(x, -n)

  def raise(_, n, acc) when n === 0, do: acc
  def raise(x, n, acc), do: raise(x, n - 1, x * acc)
end
