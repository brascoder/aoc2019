defmodule Mix.Tasks.D03.P2 do
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 2"
  def run(_args) do
    "inputs/day03.txt"
    |> File.stream!
    |> part2
    |> IO.puts
  end
end
