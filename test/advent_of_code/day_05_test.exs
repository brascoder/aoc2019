defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import ExUnit.CaptureIO
  alias AdventOfCode.IntcodeComputer

  test "part1" do
    assert IntcodeComputer.run({1002,4,3,4,33}) == {1002,4,3,4,99}
    assert IntcodeComputer.run({3,2,3}, 99) == {3,2,99}
    assert IntcodeComputer.run({4,2,99}) == {4,2,99}
    assert capture_io(fn -> IntcodeComputer.run({4,2,99}) end) == "99\n"
  end
end
