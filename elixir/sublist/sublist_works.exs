defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  # the README says start or end .. not in the middle :D
  # * A = [1, 2, 3], B = [1, 2, 3, 4, 5], A is a sublist of B
  # * A = [3, 4, 5], B = [1, 2, 3, 4, 5], A is a sublist of B
  # * A = [3, 4], B = [1, 2, 3, 4, 5], A is a sublist of B
  # * A = [1, 2, 3], B = [1, 2, 3], A is equal to B
  # * A = [1, 2, 3, 4, 5], B = [2, 3, 4], A is a superlist of B
  # * A = [1, 2, 4], B = [1, 2, 3, 4, 5], A is not a superlist of, sublist of or equal to B

  # :equal, :unequal, :superlist, :sublist
  @spec compare(List.t, List.t) :: atom
  def compare(x, x),               do: :equal
  def compare([], [_]),            do: :sublist
  def compare([_], []),            do: :superlist

  # def compare([x | []], [y | ys]), do: :unequal
  # def compare([x | xs], [y | []]), do: :unequal

  def compare([x | xs], [y | ys]) do
    xl = length(xs)
    yl = length(ys)

    cond do
      xl > yl && compare_one([x | xs], [y | ys]) -> :superlist
      xl < yl && compare_one([y | ys], [x | xs]) -> :sublist
      true                                       -> :unequal
    end
  end


  def compare_one([x | []], [y | _]), do: false
  def compare_one([x | xs], [y | ys]) do
    if compare_two([x | xs], [y | ys]) do
      true
    else
      compare_one(xs, [y | ys])
    end
  end

  def compare_two(_, []), do: true
  def compare_two([], _), do: false
  def compare_two([x | xs], [x | ys]), do: compare_two(xs, ys)
  def compare_two([x | xs], [y | ys]), do: false

# Sublist.compare_two([3,4,5], [3,4,5])
  # def compare_left(_, [], _),              do: true
  # def compare_left([x | []], [y | _]),     do: false
  #
  # def compare_left([x | xs], [x | ys]),    do: compare_left(xs, ys, [x | ys])
  # def compare_left([x | xs], [x | ys], z), do: compare_left(xs, ys, z)
  #
  # def compare_left([x | xs], [y | ys], z), do: compare_left([x | xs], z)
  # def compare_left([x | xs], [y | ys]),    do: compare_left(xs, [y | ys])

  # def compare([], _, _), do: :sublist
  # def compare([], _), do: :unequal
  # def compare(_, [], _), do: :superlist
  #


  # def compare([x | xs], [y | ys]),    do: compare Enum.reverse(xs), Enum.reverse([y | ys])
  #
end



# 12345   345
# 5432    543
# 432     43    543
# 32      3     543
# 2       []    543
#
#
#
# 1212321  123
# 212321   23    123
# 12321    3     123
# 12321    123
# 2321     23    123
# 321      3     123
# 21       []    123
#
#
# 112  1112
#
#
#
# 112  1112
# 12   112    1112
# 2    12     1112
# 2    1112
# 2    2111
# []   111    1112
#
#
# 1112 112
# 112  12     112
# 12   2      112
# 2 211
# [] 11     2
