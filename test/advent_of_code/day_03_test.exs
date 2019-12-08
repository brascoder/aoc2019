defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  test "part1" do
    result = File.stream!("test/test_inputs/day03test.txt")
             |> part1

    assert result == 159
  end

  test "part2" do
    result = File.stream!("test/test_inputs/day03test.txt")
             |> part2

    assert result == 610
  end
end
