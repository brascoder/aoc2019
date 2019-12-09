defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  alias AdventOfCode.WireUtilities

  test "part1" do
    result = File.stream!("test/test_inputs/day03test.txt")
             |> Stream.map(fn line ->
               line
               |> String.trim
               |> String.split(",")
             end)
             |> WireUtilities.shortest_manhattan_distance

    assert result == 159
  end

  test "part2" do
    result = File.stream!("test/test_inputs/day03test.txt")
             |> Stream.map(fn line ->
               line
               |> String.trim
               |> String.split(",")
             end)
             |> WireUtilities.shortest_steps_distance

    assert result == 610
  end
end
