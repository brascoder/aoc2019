defmodule Mix.Tasks.D02.P2 do
  use Mix.Task

  alias AdventOfCode.IntcodeComputer

  @shortdoc "Day 02 Part 2"
  def run(_args) do
    input = input_to_tuple("inputs/day02.txt")
    noun_verbs = for n <- 0..99, v <- 0..99, do: [n, v]

    Enum.filter(noun_verbs, fn [n, v] ->
      result = input
               |> put_elem(1, n)
               |> put_elem(2, v)
               |> IntcodeComputer.run
               |> elem(0)

      result == 19690720
    end)
    |> hd
    |> calculate
    |> IO.puts
  end

  defp input_to_tuple(input_path) do
    input_path
    |> File.read!
    |> String.trim
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp calculate([n, v]) do
    100 * n + v
  end
end
