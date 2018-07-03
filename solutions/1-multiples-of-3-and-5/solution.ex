defmodule MultiplesOf3And5 do
  @moduledoc false

  @doc """
  Find the sum of all multples of 3 and 5 upto a number

    iex> MultplesOf3And5.solve(10)
    23

  """
  def solve(number) do
    Enum.reduce(0..number - 1, 0, fn
      i, acc when rem(i, 5) == 0 or rem(i, 3) == 0 -> acc + i
      _, acc -> acc
    end)
  end
end