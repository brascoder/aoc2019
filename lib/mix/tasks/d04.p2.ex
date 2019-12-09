defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 2"
  def run(_args) do
    147981..691423
    |> part2
    |> IO.puts
  end
end
