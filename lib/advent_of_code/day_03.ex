defmodule AdventOfCode.Day03 do
  def part1([line1, line2]) do
    points1 = line_points(line1)
    points2 = line_points(line2)

    find_intersections(points1, points2)
    |> find_shortest_distance
  end

  defp line_points(line) do
    line
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

  defp find_intersections(points1, points2) do
    Enum.filter(points1, fn x -> Enum.member?(points2, x) end)
  end

  defp find_shortest_distance(points) do
    points
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min
  end
end
