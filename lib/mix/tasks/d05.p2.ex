defmodule Mix.Tasks.D05.P2 do
  use Mix.Task

  alias AdventOfCode.IntcodeComputer

  @shortdoc "Day 05 Part 2"
  def run(_args) do
    File.read!("inputs/day05.txt")
    |> String.trim
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
    |> IntcodeComputer.run(5)
  end
end
