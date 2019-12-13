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

  test "part2" do
    assert capture_io(fn ->
      IntcodeComputer.run({5,0,6,99,4,5,99})
    end) == ""

    refute capture_io(fn ->
      IntcodeComputer.run({5,1,6,99,4,5,99})
    end) == "99\n"

    assert capture_io(fn ->
      IntcodeComputer.run({6,1,6,99,4,5,99})
    end) == ""

    refute capture_io(fn ->
      IntcodeComputer.run({6,0,6,99,4,5,99})
    end) == "99\n"

    assert IntcodeComputer.run({7,4,3,5,99,33}) == {7,4,3,5,99,0}
    assert IntcodeComputer.run({7,3,4,5,99,33}) == {7,3,4,5,99,1}
    assert IntcodeComputer.run({8,3,3,5,99,33}) == {8,3,3,5,99,1}
    assert IntcodeComputer.run({8,3,4,5,99,33}) == {8,3,4,5,99,0}

    assert capture_io(fn ->
      IntcodeComputer.run({3,9,8,9,10,9,4,9,99,-1,8}, 8)
    end) == "1\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,9,8,9,10,9,4,9,99,-1,8}, 1)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,9,7,9,10,9,4,9,99,-1,8}, 7)
    end) == "1\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,9,7,9,10,9,4,9,99,-1,8}, 9)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,3,1108,-1,8,3,4,3,99}, 8)
    end) == "1\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,3,1108,-1,8,3,4,3,99}, 1)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,3,1107,-1,8,3,4,3,99}, 7)
    end) == "1\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,3,1107,-1,8,3,4,3,99}, 9)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9}, 2)
    end) == "1\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9}, 0)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,3,1105,-1,9,1101,0,0,12,4,12,99,1}, 0)
    end) == "0\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, 2)
    end) == "999\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, 8)
    end) == "1000\n"

    assert capture_io(fn ->
      IntcodeComputer.run({3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99}, 12)
    end) == "1001\n"
  end
end
