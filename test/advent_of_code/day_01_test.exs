defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    assert part1([12]) == 2
    assert part1([14]) == 2
    assert part1([1969]) == 654
    assert part1([100756]) == 33583
  end

  test "part2" do
    assert part2([14]) == 2
    assert part2([1969]) == 966
    assert part2([100756]) == 50346
  end
end
