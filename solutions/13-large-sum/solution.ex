defmodule LargeSum do
  @moduledoc false

  def solve(integers) do
    integers
    |> Enum.sum()
    |> Integer.to_string()
    |> String.slice(0, 10)
    |> String.to_integer
  end
end