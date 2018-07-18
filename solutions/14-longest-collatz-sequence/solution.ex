defmodule LongestCollatzSequence do

  def solve(max_number) do
    Enum.reduce(max_number..1, {0, 0}, fn number, {max_chain, max_number} ->
      current_chain = collatz_sequence(number, 0)
      if current_chain > max_chain do
        {current_chain, number}
      else
        {max_chain, max_number}
      end
    end)
  end

  def collatz_sequence(1, count), do: count + 1
  def collatz_sequence(number, count) do
    if rem(number, 2) == 0 do
      collatz_sequence(trunc(number / 2), count + 1)
    else
      collatz_sequence(3 * number + 1, count + 1)
    end
  end
end