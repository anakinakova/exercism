defmodule Bob do
  def hey(input) do
    cond do
      String.last(input) == "?" ->
        "Sure."
      String.trim(input) == "" ->
        "Fine. Be that way!"
      String.upcase(input) == input && String.downcase(input) != input ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end


# Regex.match?(~r/\?$/, input) -> "Sure."
# Regex.match?(~r/^(?=.[^a-z])(?=.*[\p{Lu}]).+$/, input) -> "Whoa, chill out!"
# Regex.match?(~r/^\s*$/, input) -> "Fine. Be that way!"
# true -> "Whatever."
