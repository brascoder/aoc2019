defmodule FuelCalc do
  def call(input_path) do
    File.stream!(input_path)
    |> Enum.reduce(0, fn line, acc ->
      module = line
               |> String.trim
               |> String.to_integer

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

IO.puts FuelCalc.call("input.txt")
