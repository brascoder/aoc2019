defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  alias AdventOfCode.FuelCalculator

  test "part1" do
    assert FuelCalculator.run([12]) == 2
    assert FuelCalculator.run([14]) == 2
    assert FuelCalculator.run([1969]) == 654
    assert FuelCalculator.run([100756]) == 33583
  end

  test "part2" do
    assert FuelCalculator.run([14], true) == 2
    assert FuelCalculator.run([1969], true) == 966
    assert FuelCalculator.run([100756], true) == 50346
  end
end
