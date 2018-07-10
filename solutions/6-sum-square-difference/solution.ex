defmodule SumSquareDifference do
  @moduledoc false

  @doc """
  """
  def solve(args) do
    compose_1(&square/1, &sum/1).(args) - compose_n(&sum/1, &square/1).(args)
  end

  @doc """
  Composition function that takes a list, and passes a number to the 2nd
  function
  """
  def compose_1(f, g) when is_function(g) do
    fn arg ->
      compose(f, g.(arg))
    end
  end

  @doc """
  Composition function that takes a list, and passes a list to the 2nd function
  """
  def compose_n(f, g) when is_function(g) do
    fn args ->
      compose(f, Enum.map(args, & g.(&1)))
    end
  end

  def compose(f, args), do: f.(args)

  def square(x), do: x * x

  def add(a, b), do: a + b

  def sum(nums) do
    Enum.reduce(nums, 0, &add/2)
  end
end