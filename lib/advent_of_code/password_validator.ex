defmodule AdventOfCode.PasswordValidator do
  def run(digits) do
    double_digit?(digits) && always_increasing?(digits)
  end

  def run_strict(digits) do
    only_doubles?(digits) && always_increasing?(digits)
  end

  defp double_digit?(digits) do
    Enum.count(digits) > Enum.dedup(digits) |> Enum.count
  end

  defp always_increasing?(digits) do
    digits == Enum.sort(digits)
  end

  defp only_doubles?(digits) do
    digits
    |> Stream.chunk_by(&(&1))
    |> Enum.any?(&(length(&1) == 2))
  end
end
