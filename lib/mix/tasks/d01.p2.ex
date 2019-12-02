defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 2"
  def run(_args) do
    File.read!("inputs/day01.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.to_integer
    end)
    |> part2
    |> IO.puts
  end
end
