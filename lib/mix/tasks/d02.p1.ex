defmodule Mix.Tasks.D02.P1 do
  use Mix.Task

  alias AdventOfCode.IntcodeComputer

  @shortdoc "Day 02 Part 1"
  def run(_args) do
    File.read!("inputs/day02.txt")
    |> String.trim
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
    |> put_elem(1, 12)
    |> put_elem(2, 2)
    |> IntcodeComputer.run
    |> elem(0)
    |> IO.puts
  end
end
