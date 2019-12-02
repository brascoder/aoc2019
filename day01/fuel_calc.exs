defmodule FuleCalc do
  def call(input_path) do
    File.stream!(input_path)
    |> Enum.reduce(0, fn line, acc ->
      module = line
               |> String.trim
               |> String.to_integer

      acc + calculate(module)
    end)
  end

  def calculate(module) do
    div(module, 3) - 2
  end
end

IO.puts FuleCalc.call("input.txt")
