defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  # :equal, :unequal, :superlist, :sublist
  @spec compare(List.t, List.t) :: atom
  def compare(x, x),               do: :equal
  def compare([], [_]),            do: :sublist
  def compare([_], []),            do: :superlist

  def compare(x, y) do
    xl = length(x)
    yl = length(y)

    cond do
      xl > yl -> compare(x, y, :superlist)
      xl < yl -> compare(y, x, :sublist)
      true    -> :unequal
    end
  end

  # z is :superlist or :sublist
  def compare([_ | []], [_ | _], _),  do: :unequal
  def compare([x | xs], [y | ys], z) do
    if compare_two([x | xs], [y | ys]) do
      z
    else
      compare(xs, [y | ys], z)
    end
  end

  def compare_two(_, []), do: true
  def compare_two([], _), do: false
  def compare_two([x | xs], [x | ys]), do: compare_two(xs, ys)
  def compare_two(_, _), do: false
end
