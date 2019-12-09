defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  alias AdventOfCode.FuelCalculator

  @shortdoc "Day 01 Part 1"
  def run(_args) do
    File.read!("inputs/day01.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> FuelCalculator.run
    |> IO.puts
  end
end
