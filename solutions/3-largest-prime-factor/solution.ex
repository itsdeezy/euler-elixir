defmodule LargestPrimeFactor do
  @moduledoc false

  @doc """
  """
  def solve(number) do
    Enum.reduce_while(2..number, 0, fn factor, acc ->
      case complimentary_factor_r(number, factor) do
        :none -> {:cont, acc}
        number ->
          case is_prime?(number) do
            true -> {:halt, number}
            false -> {:cont, acc}
          end
      end
    end)
  end

  defp complimentary_factor_r(number, n) do
    if rem(number, n) == 0, do: trunc(number / n), else: :none
  end

  # For any number n, it must have no other factors other than 1 & n.
  defp is_prime?(n), do: !Enum.any?(2..n - 1, fn f -> rem(n, f) == 0 end)
end