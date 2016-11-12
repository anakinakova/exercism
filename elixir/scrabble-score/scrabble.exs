defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  # WE ASSUME THAT WE ARE GIVEN LEGIT WORDS !!
  @spec score(String.t) :: non_neg_integer
  def score(word),          do: to_charlist(word) |> cscore
  def score(word, :double), do: 2 * score(word)
  def score(word, :triple), do: 3 * score(word)

  def cscore([]),       do: 0
  def cscore([x | xs]), do: letter_score(x) + cscore(xs)

  # def letter_score x when x in 'AEIOULNRST', do: 1
  def letter_score(x) when ?a <= x,           do: letter_score(x-(?a-?A))
  def letter_score(x) when x in 'DG',         do: 2
  def letter_score(x) when x in 'BCMP',       do: 3
  def letter_score(x) when x in 'FHVWY',      do: 4
  def letter_score(x) when x == ?K,           do: 5
  def letter_score(x) when x in 'JX',         do: 8
  def letter_score(x) when x in 'QZ',         do: 10
  def letter_score(x) when x in '\t\n ',      do: 0
  def letter_score(_),                        do: 1
end
