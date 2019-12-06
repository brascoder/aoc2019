defmodule AdventOfCode.Day03 do
  def part1(input_stream) do
    input_stream
    |> Stream.map(&line_points/1)
    |> find_intersections
    |> find_shortest_distance
  end

  def part2(input_stream) do
    input_stream
    |> Stream.map(&line_points/1)
    |> find_shortest_segments
  end

  defp line_points(line) do
    line
    |> String.trim
    |> String.split(",")
    |> Enum.reduce([], fn i, acc ->
      case acc do
        [] -> move({0, 0}, i)
        _ -> List.flatten(move(hd(acc), i), acc)
      end
    end)
  end

  defp move({x, y}, instruction) do
    {direction, distance} = instruction
                            |> String.split_at(1)

    1..String.to_integer(distance)
    |> Enum.map(fn n ->
      case direction do
        "U" -> {x, y + n}
        "D" -> {x, y - n}
        "R" -> {x + n, y}
        "L" -> {x - n, y}
      end
    end)
    |> Enum.reverse
  end

  defp find_intersections(lines) do
    lines
    |> Stream.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
  end

  defp find_shortest_distance(points) do
    points
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min
  end

  defp find_shortest_segments(lines) do
    intersections = find_intersections(lines)

    lines
    |> Stream.map(fn line ->
      line
      |> Enum.filter(fn point -> Enum.member?(intersections, point) end)
      |> Enum.map(fn point ->
        {point, Enum.find_index(line, fn p -> p == point end) + 1}
      end)
      |> Enum.min_by(fn {_, i} -> i end)
    end)
    |> Enum.reduce(0, fn {{_, _}, i}, acc -> acc + i end)
  end
end
