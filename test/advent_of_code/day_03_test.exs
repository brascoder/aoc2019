defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  test "part1" do
    result = "R8,U5,L5,D3\nU7,R6,D4,L4"
             |> create_stream
             |> part1

    assert result == 6

    result = "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"
             |> create_stream
             |> part1

    assert result == 159

    result = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
             |> create_stream
             |> part1

    assert result == 135
  end

  test "part2" do
    result = "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"
             |> create_stream
             |> part2

    assert result == 610

    result = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
             |> create_stream
             |> part2

    assert result == 410
  end

  defp create_stream(str) do
    {:ok, stream} = StringIO.open(str)
    IO.binstream(stream, :line)
  end
end
