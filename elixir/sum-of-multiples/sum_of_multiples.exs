defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, [x | xs]) do
    add_multiples(limit, x, 1) - ff(limit, x, xs)
  end
  def to(limit, [x | xs]) when x < limit, do: x - ff(limit, x, xs) + to(limit, [x+x | xs])
  def to(limit, []), do: 0
  def to(limit, [x | xs]), do: to(limit, xs)

  def add_multiples(limit, x, m) when x < limit, do: x + add_multiples(limit, x*m, m+1)

  def ff(limit, x, [y | ys]) when x*y < limit, do: x*y + ff(limit, x, ys)
  def ff(limit, x, []),                        do: 0
  def ff(limit, x, [_ | ys]),                  do: ff(limit, x, ys)
end
