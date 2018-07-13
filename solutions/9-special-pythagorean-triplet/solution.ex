defmodule SpecialPythagoreanTriplet do
  @moduledoc false

  def solve(n) do
    # Numbers must be natural, we'll fix b and find a, s.t. c > b > a
    # This means [2, b, ceil((n - 1) / 2)]
    Enum.flat_map_reduce(2..trunc(n / 2), 0, fn b, acc ->
      a_values = Enum.filter(1..b, &satisfies_eqn?(&1, b, n))
      {Enum.map(a_values, & {&1, b, n - b - &1}), acc + 1}
    end)
  end

  defp satisfies_eqn?(a, b, n) do
    term_1 = :math.pow(:math.pow(a, 2) + :math.pow(b, 2), 0.5)
    term_2 = a + b
    term_1 + term_2 == n * 1.0
  end
end