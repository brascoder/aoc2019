defmodule AdventOfCode.FuelCalculator do
  def run(input, recursive \\ false) do
    input
    |> Enum.reduce(0, fn module, acc ->
      case recursive do
        true -> acc + recalculate(module)
        _    -> acc + calculate(module)
      end
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
