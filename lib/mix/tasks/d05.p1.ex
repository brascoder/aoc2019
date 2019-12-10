defmodule Mix.Tasks.D05.P1 do
  use Mix.Task

  alias AdventOfCode.IntcodeComputer

  @shortdoc "Day 05 Part 1"
  def run(_args) do
    File.read!("inputs/day05.txt")
    |> String.trim
    |> String.split(",")
    |> List.to_tuple
    |> IntcodeComputer.run
    |> elem(0)
    |> IO.puts
  end
end
