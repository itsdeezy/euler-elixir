defmodule HighlyDivisibleTriangularNumber do
  @moduledoc false

  def solve(num_of_factors) do
    find_triangle_with(1, 1, num_of_factors)
  end

  def find_triangle_with(number, iteration, num_of_factors) do
    if number |> factorize() |> length > num_of_factors do
      number
    else
      iteration = iteration + 1
      triangle_number = number + iteration
      find_triangle_with(triangle_number, iteration, num_of_factors)
    end
  end

  defp factorize(number) do
    prime_factors = prime_factorize(number, [])
    0..length(prime_factors) - 1
    |> Enum.reduce([], & &2 ++ comb(&1, prime_factors))
    |> Enum.uniq
    |> Enum.map(fn l -> Enum.reduce(l, 1, & &1 * &2) end)
    |> Kernel.++([number])
  end

  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end

  defp prime_factorize(number, factors) do
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
      |> prime_factorize(factors)
    end
  end
end