defmodule LatticePaths do
  def solve(size) do
    # summation(fn k -> 2 * combination(size, k) end, 1..size)
    combination(size * 2, size)
  end

  def summation(func, range) do
    Enum.reduce(range, 0, & &2 + func.(&1))
  end

  def combination(n, k) do
    trunc(factorial(n) / (factorial(k) * factorial(n - k)))
  end

  def factorial(n) when n < 0, do: :nan
  def factorial(0), do: 1
  def factorial(1), do: 1
  def factorial(n), do: n * factorial(n - 1)
end
