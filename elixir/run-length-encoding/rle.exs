# this is terrible and took me way too long

defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""),     do: ""
  def encode(string), do: to_charlist(string) |> c_encode

  # this looks illegible af
  defp c_encode([head | tail]),           do: c_encode(head, tail, 1, [])
  defp c_encode(x, [x | tail], occ, out), do: c_encode(x, tail, occ + 1, out)
  defp c_encode(x, [y | tail], occ, out), do: c_encode(y, tail, 1, [x, to_charlist(occ) | out])
  defp c_encode(x, [], occ, out),         do: [x, to_charlist(occ) | out] |> Enum.reverse |> to_string

  @spec decode(String.t) :: String.t
  def decode(""),     do: ""
  def decode(string), do: to_charlist(string) |> c_decode

  # so does this :(
  defp c_decode([head | tail]),                               do: c_decode(head - 48, tail, "")
  defp c_decode(n, [x | tail], out) when ?0 <= x and x <= ?9, do: c_decode(n * 10 + x - 48, tail, out)
  defp c_decode(n, [x | []], out),                            do: out <> write_chars(n, x)
  defp c_decode(n, [x | tail], out),                          do: c_decode(0, tail, (out <> write_chars(n, x)))

  # n is an integer, and x is a char
  def write_chars(n, x), do: String.duplicate(<<x>>, n)
end
