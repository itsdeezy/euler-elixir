defmodule SummationOfPrimes do
  @moduledoc false

  def solve(number, sieve_fn \\ &faster_sieve/2) do
    2..number
    |> Enum.into([])
    |> sieve_fn.([])
    |> Enum.sum()
  end

  def benchmark(number \\ 10_000) do
    IO.puts "== Running sieve"
    {time, answer} = :timer.tc(__MODULE__, :solve, [number, &sieve/2])
    IO.puts "== Finished in #{inspect(div(time, 100_000) / 10)}s - #{answer}"

    IO.puts "== Running faster_sieve"
    {time, answer} = :timer.tc(__MODULE__, :solve, [number, &faster_sieve/2])
    IO.puts "== Finished in #{inspect(div(time, 100_000) / 10)}s - #{answer}"
  end

  defp sieve([], primes), do: primes

  defp sieve([prime | candidates], primes) do
    [prime | sieve(reject_multiples(candidates, prime), primes)]
  end

  defp faster_sieve([], primes), do: primes

  # We don't tail optimize because we're going to take advantage
  # of a shortcut. If the rejected candidates count is 1, we know they're
  # all primes left
  defp faster_sieve(candidates, primes) do
    [prime | candidates_tail] = candidates
    new_candidates = reject_multiples(candidates_tail, prime)
    if length(candidates) - length(new_candidates) == 1 do
      [prime | new_candidates]
    else
      [prime | faster_sieve(new_candidates, primes)]
    end
  end

  defp reject_multiples(numbers, factor) do
    Enum.reject(numbers, &(rem(&1, factor) == 0))
  end
end