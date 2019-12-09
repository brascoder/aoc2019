defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  alias AdventOfCode.PasswordValidator

  test "part1" do
    assert PasswordValidator.run(["1", "1", "1", "1", "1", "1"])
    refute PasswordValidator.run(["1", "2", "3", "4", "5", "0"])
    refute PasswordValidator.run(["1", "2", "3", "7", "8", "9"])
  end

  test "part2" do
    assert PasswordValidator.run_strict(["1", "1", "2", "2", "3", "3"])
    refute PasswordValidator.run_strict(["1", "2", "3", "4", "4", "4"])
    assert PasswordValidator.run_strict(["1", "1", "1", "1", "2", "2"])
  end
end
