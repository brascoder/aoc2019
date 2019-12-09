defmodule Mix.Tasks.D04.P1 do
  use Mix.Task

  alias AdventOfCode.PasswordValidator

  @shortdoc "Day 04 Part 1"
  def run(_args) do
    147981..691423
    |> Stream.filter(fn code ->
      digits = code
               |> Integer.to_string
               |> String.codepoints

      PasswordValidator.run(digits)
    end)
    |> Enum.count
    |> IO.puts
  end
end
