defmodule Mix.Tasks.D03.P1 do
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 1"
  def run(_args) do
    "inputs/day03.txt"
    |> File.stream!
    |> part1
    |> IO.puts
  end
end
