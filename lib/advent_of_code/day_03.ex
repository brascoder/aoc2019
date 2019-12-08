defmodule AdventOfCode.Day03 do
  def part1(input_stream) do
    input_stream
    |> setup_lines
    |> find_intersections
    |> find_shortest_distance
  end

  def part2(input_stream) do
    input_stream
    |> setup_lines
    |> find_shortest_steps
  end

  defp setup_lines(lines) do
    lines
    |> Stream.map(fn line ->
      line
      |> String.trim
      |> String.split(",")
    end)
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

  defp find_intersections(lines) do
    lines
    |> Stream.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> MapSet.delete({0, 0})
  end

  defp find_shortest_distance(points) do
    points
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min
  end

  defp find_shortest_steps(lines) do
    find_intersections(lines)
    |> Stream.map(fn intersection ->
      Enum.reduce(lines, 0, fn line, acc ->
        acc + Enum.find_index(line, fn p -> p == intersection end) + 1
      end)
    end)
    |> Enum.min
  end
end
