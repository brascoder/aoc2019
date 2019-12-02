defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(_args) do
    File.read!("inputs/day01.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> part1
    |> IO.puts
  end
end
