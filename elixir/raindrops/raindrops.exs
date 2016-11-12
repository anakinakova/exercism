defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def  convert(n),                             do: convert(n, 3, "")
  defp convert(n, i = 9, fs) when fs == "",    do: to_string(n)
  defp convert(n, i = 9, fs),                  do: fs
  defp convert(n, i = 7, fs) when rem(n,i)==0, do: convert(n, 9, fs <> "Plong")
  defp convert(n, i = 5, fs) when rem(n,i)==0, do: convert(n, 7, fs <> "Plang")
  defp convert(n, i = 3, fs) when rem(n,i)==0, do: convert(n, 5, fs <> "Pling")
  defp convert(n, i, fs),                      do: convert(n, i+2, fs)
  # def factorise(n), do: factorise(n, 3, []) #|> Enum.sort
  # defp factorise(_, i, fs) when i == 9,      do: fs
  # defp factorise(n, i, fs) when rem(n,i)==0, do: factorise(n, i + 2, [i | fs])
  # defp factorise(n, i, fs),                  do: factorise(n, i + 2, fs)
end

# defp output(0, 0, 0, _), do: "PlingPlangPlong"
# defp output(0, _, 0, _), do: "PlingPlong"
# defp output(_, 0, 0, _), do: "PlangPlong"
# defp output(0, 0, _, _), do: "PlingPlang"
# defp output(0, _, _, _), do: "Pling"
# defp output(_, 0, _, _), do: "Plang"
# defp output(_, _, 0, _), do: "Plong"
# defp output(_, _, _, n), do: "#{n}
