defmodule SmallestMultiple do
  @moduledoc false

  def solve(numbers) when is_list(numbers) do
    factor_recurrence_keyword = Enum.reduce(numbers, %{}, fn number, acc ->
      number
      |> prime_factorization([])
      |> count_occurrence()
      |> Map.merge(acc, fn _k, v1, v2 -> max(v1, v2) end)
    end)

    Enum.reduce(factor_recurrence_keyword, 1, fn {num, count}, acc ->
      acc * :math.pow(num, count)
    end)
  end

  defp count_occurrence(list) do
    Enum.reduce(list, %{}, fn el, acc -> Map.update(acc, el, 1, &(&1 + 1)) end)
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(n)
  defp prime_factorization(number, factors) do
    prime_factor = Enum.find_value(2..number, fn factor ->
      if rem(number, factor) == 0, do: factor
    end)

    factors = [prime_factor | factors]

    if prime_factor == number do
      factors
    else
      number
      |> Kernel./(prime_factor)
      |> trunc()
      |> prime_factorization(factors)
    end
  end
end