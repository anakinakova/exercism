defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.downcase(sentence)
    # this part made my brain hurt
    |> String.split(~r/[^\p{L}\p{Pd}\p{N}]/iu, trim: true)
    |> histogram
  end

  @spec count_word([String.t], String.t) :: non_neg_integer
  defp count_word([word | tail], word), do: 1 + count_word(tail, word)
  defp count_word([_ | tail], word), do: 0 + count_word(tail, word)
  defp count_word([], _), do: 0

  @spec histogram([String.t]) :: map
  def histogram(sentence) do
    Enum.reduce(sentence, %{}, fn(x, acc)
      -> Map.merge acc, %{x => count_word(sentence, x)} end)
  end
end
