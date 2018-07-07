defmodule LargestPalindromeProduct do
  @moduledoc false

  @doc """
  """
  def solve do
    Enum.reduce(999..100, 0, fn x, acc ->
      product = Enum.reduce(999..100, acc, fn y, acc ->
        product = x * y
        if is_palindrome?(product) and product > acc, do: product, else: acc
      end)
      if product > acc, do: product, else: acc
    end)
  end

  defp is_palindrome?(number) do
    charlist = Integer.to_charlist(number)
    charlist == Enum.reverse(charlist)
  end
end
