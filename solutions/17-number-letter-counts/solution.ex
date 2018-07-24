defmodule NumberLetterCounts do

  def solve(up_to) do
    1..up_to
    |> Enum.map(&translate/1)
    |> Enum.join()
    |> String.length
  end

  @prefixs ~w(twen thir for fif six seven eigh nine)
  def prefix(n) when n < 2, do: :no_prefix
  def prefix(n), do: Enum.at(@prefixs, n - 2)

  @primals ~w(one two three four five six seven eight nine ten)
  def translate(n) when n < 1, do: :no_translation
  def translate(n) when n <= 10, do: Enum.at(@primals, n-1)
  def translate(11), do: "eleven"
  def translate(12), do: "twelve"
  def translate(14), do: "fourteen"
  def translate(n) when n < 20, do: "#{n |> digit_at(0) |> prefix()}teen"
  def translate(n) when n < 100 do
    tens = digit_at(n, 1)
    case rem(n, tens * 10) do
      0 -> "#{prefix(tens)}ty"
      rest -> "#{prefix(tens)}ty#{translate(rest)}"
    end
  end

  def translate(n) when n < 1000 do
    hundreds = digit_at(n, 2)
    case rem(n, hundreds * 100) do
      0 -> "#{translate(hundreds)}hundred"
      rest -> "#{translate(hundreds)}hundredand#{translate(rest)}"
    end
  end

  def translate(n) when n < 10000 do
    thousands = digit_at(n, 3)
    case rem(n, thousands * 1000) do
      0 -> "#{translate(thousands)}thousand"
      rest -> "#{translate(thousands)}thousand#{translate(rest)}"
    end
  end

  def digit_at(n, at) do
    n
    |> Integer.to_string()
    |> String.reverse
    |> String.slice(at, 1)
    |> String.to_integer()
  end
end