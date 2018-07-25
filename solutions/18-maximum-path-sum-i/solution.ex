defmodule MaximumPathSumI do
  alias Graph.Utils

  def solve(tree_matrix) do
    tree_matrix
    |> parse_tree()
    |> reduce_max_path
  end

  # Could do recursion here, but we just need the entire tree reduced
  def reduce_max_path(graph) do
    graph
    |> Graph.postorder()
    |> Enum.reduce({0, graph}, fn node, {total, g} ->
      [cur_val] = Graph.vertex_labels(g, node)
      case Graph.out_edges(g, node) do
        [] -> {total, g}
        edges ->
          val = Enum.reduce(edges, cur_val, fn %{v2: v2}, t ->
            [child_v] = Graph.vertex_labels(g, v2)
            max(t, cur_val + child_v)
          end)

          {max(total, val), replace_vertex_label(g, node, [val])}
      end
    end)
  end

  def parse_tree(tree_matrix) do
    {_, graph} = Enum.reduce(tree_matrix, {[], Graph.new}, fn
      row, {[], graph} ->

        Enum.reduce(row, {[], graph}, fn label, {id_row, g} ->
          node = UUID.uuid4
          {id_row ++ [node], Graph.add_vertex(g, node, label)}
        end)

      row, {parents, graph} ->
        reducer = fn {label, idx}, {id_row, graph} ->
          node = UUID.uuid4

          graph = case idx do
            0 -> graph
            idx ->
              l_parent = Enum.at(parents, idx - 1)
              graph
              |> Graph.add_vertex(node, label)
              |> Graph.add_edge(l_parent, node)
          end

          graph = case Enum.at(parents, idx) do
            nil -> graph
            parent ->
              graph
              |> Graph.add_vertex(node, label)
              |> Graph.add_edge(parent, node)
          end

          {id_row ++ [node], graph}
        end

        row
        |> Enum.with_index()
        |> Enum.reduce({[], graph}, reducer)
    end)

    graph
  end

  def debug(graph) do
    graph
    |> Graph.edges
    |> Enum.map(fn %{v1: v1, v2: v2} ->
      [a] = Graph.vertex_labels(graph, v1)
      [b] = Graph.vertex_labels(graph, v2)
      "#{a} -> #{b}"
    end)
  end

  def replace_vertex_label(
    %Graph{vertices: vs, vertex_labels: labels} = g, v, vlabels
  )
      when is_list(vlabels) do
    with v_id <- Utils.vertex_id(v),
        true <- Map.has_key?(vs, v_id),
        labels <- Map.put(labels, v_id, vlabels) do
      %Graph{g | vertex_labels: labels}
    else
      _ -> {:error, {:invalid_vertex, v}}
    end
  end
end