defmodule EvenFibonacciNumbers do
  @moduledoc false

  @doc """
  """
  def solve(number) do
    fibonacci_sum_upto(0, 1, 0, number)
  end

  def fibonacci_sum_upto(num1, num2, sum, upto) do
    fibonacci = num1 + num2

    sum = if rem(fibonacci, 2) == 0 do
      sum + fibonacci
    else
      sum
    end

    if fibonacci + num2 > upto do
      sum
    else
      fibonacci_sum_upto(num2, fibonacci, sum, upto)
    end
  end
end