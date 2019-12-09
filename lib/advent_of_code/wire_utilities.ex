defmodule AdventOfCode.WireUtilities do
  def shortest_manhattan_distance(wires) do
    wires
    |> trace_wires
    |> find_intersections
    |> find_shortest_manhattan_distance
  end

  def shortest_steps_distance(wires) do
    wires
    |> trace_wires
    |> find_shortest_steps_distance
  end

  defp trace_wires(wires) do
    wires
    |> Stream.map(fn instructions ->
      instructions
      |> Stream.map(&String.split_at(&1, 1))
      |> Enum.reduce([{0, 0}], &generate_points/2)
    end)
    |> Stream.map(fn points ->
      points
      |> Enum.reverse
      |> tl
    end)
  end

  defp generate_points({direction, distance}, points) do
    points
    |> Stream.iterate(fn [{x, y} = prev | rest] ->
      point = case direction do
        "U" -> {x, y + 1}
        "D" -> {x, y - 1}
        "R" -> {x + 1, y}
        "L" -> {x - 1, y}
      end

      [point, prev | rest]
    end)
    |> Stream.drop(1)
    |> Stream.take(String.to_integer(distance))
    |> Enum.at(-1)
  end

  defp find_intersections(wires) do
    wires
    |> Stream.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> MapSet.delete({0, 0})
  end

  defp find_shortest_manhattan_distance(points) do
    points
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min
  end

  defp find_shortest_steps_distance(wires) do
    find_intersections(wires)
    |> Stream.map(fn intersection ->
      Enum.reduce(wires, 0, fn wire, acc ->
        acc + Enum.find_index(wire, fn p -> p == intersection end) + 1
      end)
    end)
    |> Enum.min
  end
end
