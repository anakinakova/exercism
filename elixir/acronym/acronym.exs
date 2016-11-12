defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/\b\w|[A-Z]/u, string)
      |> Enum.reduce("", fn([x], acc) ->
        acc <> String.upcase(x)
      end)
  end
end

# Regex.scan(~r/[A-Z]|\s[a-z]/, string)
# Regex.scan(~r/\b\w|[A-Z]/, string)
