defmodule AdventOfCode.Day04 do
  def part1(range) do
    range
    |> Stream.filter(fn code ->
      codepoints = code
                   |> Integer.to_string
                   |> String.codepoints

      double_digit?(codepoints) && always_increasing?(codepoints)
    end)
    |> Enum.count
  end

  def part2(range) do
    range
    |> Stream.filter(fn code ->
      codepoints = code
                   |> Integer.to_string
                   |> String.codepoints

      only_doubles?(codepoints) && always_increasing?(codepoints)
    end)
    |> Enum.count
  end

  defp double_digit?(codepoints) do
    Enum.count(codepoints) > Enum.dedup(codepoints) |> Enum.count
  end

  defp always_increasing?(codepoints) do
    codepoints == Enum.sort(codepoints)
  end

  defp only_doubles?(codepoints) do
    codepoints
    |> Stream.chunk_by(&(&1))
    |> Enum.any?(&(length(&1) == 2))
  end
end
