defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(_, 0), do: 1
  def raise(x, n) when n > 0, do: raise(x, n, 1)
  def raise(x, n), do: 1.0 / raise(x, -n)

  def raise(_, n, acc) when n === 0, do: acc
  def raise(x, n, acc), do: raise(x, n - 1, x * acc)

  def nth_root(x, n), do: nth_root(x, n, x / 2.0)
  def nth_root(x, n, a) do
    IO.puts("Current guess is #{a}")

    f = raise(a, n) - x
    f_prime = n * raise(a, n - 1)
    next = a - f / f_prime
    change = abs(a - next)

    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end
