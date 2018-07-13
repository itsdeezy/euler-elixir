defmodule LargestProductInASeries do
  @moduledoc false

  def solve(series, len) do
    series
    |> String.split("0")
    |> Enum.map(fn str ->
      str
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.filter(& length(&1) >= len)
    |> Enum.reduce(0, reduce_max_product_of_len(len))
  end

  defp reduce_max_product_of_len(len) do
    fn list, max_so_far ->
      product = if length(list) == len do
        product_of_list(list)
      else
        Enum.reduce(0..length(list) - len, 0, fn idx, max ->
          list
          |> Enum.slice(idx .. idx + len - 1)
          |> product_of_list()
          |> max(max)
        end)
      end
      max(max_so_far, product)
    end
  end

  defp product_of_list(list), do: Enum.reduce(list, 1, & &1*&2)
end