defmodule LargestProductInAGrid do
  @moduledoc false

  def solve(matrix) do
    reduce_with_index(matrix, 0, fn {column, x}, highest_so_far ->
      reduce_with_index(column, highest_so_far, fn {_, y}, highest_so_far ->
        max(highest_so_far, highest_possible_product_at(matrix, x, y))
      end)
    end)
  end

  defp highest_possible_product_at(matrix, x, y) do
    [{1, 0}, {0, 1}, {-1, 0}, {0, -1}, {1, 1}, {1, -1}, {-1, -1}, {-1, 1}]
    |> Enum.map(&product_four_in_a_row(matrix, x, y, &1))
    |> Enum.max()
  end

  defp product_four_in_a_row(matrix, x, y, {dx, dy}) do
    access(matrix, x + (dx * 0), y + (dy * 0)) *
    access(matrix, x + (dx * 1), y + (dy * 1)) *
    access(matrix, x + (dx * 2), y + (dy * 2)) *
    access(matrix, x + (dx * 3), y + (dy * 3))
  end

  defp reduce_with_index(enumerable, default, reducer) do
    enumerable
    |> Enum.with_index
    |> Enum.reduce(default, reducer)
  end

  defp access(_, x, y) when x < 0 or y < 0, do: 0
  defp access(matrix, x, y) do
    column = case Enum.at(matrix, x) do
      nil -> []
      arr -> arr
    end

    case Enum.at(column, y) do
      nil -> 0
      val -> val
    end
  end
end