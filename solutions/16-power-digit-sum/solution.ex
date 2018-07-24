defmodule PowerDigitSum do
  def solve(0), do: 1
  def solve(exponent) do
    1..exponent
    |> Enum.reduce([1], fn _, soln -> double(soln) end)
    |> Enum.sum()
  end

  def double(list) do
    reducer = fn
      {digit, idx}, {carry, list} when digit * 2 + carry < 10 ->
        {0, List.replace_at(list, idx, digit * 2 + carry)}
      {digit, idx}, {carry, list} ->
        {1, List.replace_at(list, idx, digit * 2 + carry - 10)}
    end

    list
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce({0, list}, reducer)
    |> case do
      {0, list} -> Enum.reverse(list)
      {1, list} -> [1 | Enum.reverse(list)]
    end
  end
end