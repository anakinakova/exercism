defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """

  @spec count([char], char) :: non_neg_integer
  def count(_, nucleotide) when not nucleotide in @nucleotides, do: raise ArgumentError, message: "invalid argument: #{nucleotide}"
  def count([head | _], _) when not head in @nucleotides, do: raise ArgumentError, message: "invalid argument: #{head}"
  def count([nucleotide | tail], nucleotide), do: 1 + count(tail, nucleotide)
  def count([_ | tail], nucleotide), do: 0 + count(tail, nucleotide)
  def count([], _), do: 0

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(@nucleotides, %{}, fn(x, acc)
      -> Map.merge acc, %{x => count(strand, x)} end)
    # Enum.map(@nucleotides, fn(x) -> {x, count(strand, x)} end) |> Map.new
  end
end
