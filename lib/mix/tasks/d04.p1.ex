defmodule Mix.Tasks.D04.P1 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 1"
  def run(_args) do
    147981..691423
    |> part1
    |> IO.puts
  end
end
