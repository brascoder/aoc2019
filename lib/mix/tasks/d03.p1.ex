defmodule Mix.Tasks.D03.P1 do
  use Mix.Task

  alias AdventOfCode.WireUtilities

  @shortdoc "Day 03 Part 1"
  def run(_args) do
    "inputs/day03.txt"
    |> File.stream!
    |> Stream.map(fn line ->
      line
      |> String.trim
      |> String.split(",")
    end)
    |> WireUtilities.shortest_manhattan_distance
    |> IO.puts
  end
end
