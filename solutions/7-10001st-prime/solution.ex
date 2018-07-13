defmodule TenThousandAndFirstPrime do
  @moduledoc false

  def solve(n) when n < 1, do: :error
  def solve(n) do
    Enum.reduce(1..n, 1, fn _, number ->
      find_next_prime(number + 1)
    end)
  end

  defp find_next_prime(number) do
    if is_prime?(number) do
      number
    else
      find_next_prime(number + 1)
    end
  end

  # Time complexity O(n)
  defp is_prime?(2), do: true
  defp is_prime?(n), do: !Enum.any?(2..n - 1, fn f -> rem(n, f) == 0 end)
end