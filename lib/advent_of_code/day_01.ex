defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> Enum.reduce(0, fn module, acc ->
      acc + calculate(module)
    end)
  end

  def part2(input) do
    input
    |> Enum.reduce(0, fn module, acc ->
      acc + recalculate(module)
    end)
  end

  defp calculate(module) do
    div(module, 3) - 2
  end

  defp recalculate(module) do
    result = calculate(module)
    case result < 1 do
      true -> 0
      false -> result + recalculate(result)
    end
  end
end
