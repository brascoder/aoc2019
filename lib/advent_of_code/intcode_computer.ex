defmodule AdventOfCode.IntcodeComputer do
  def run(input) do
    read_head = 0

    input
    |> calculate(read_head)
  end

  defp calculate(intcode, read_head) do
    optcode = elem(intcode, read_head)

    case optcode do
      99 ->
        intcode
      1 ->
        {op1, op2, target} = parse_block(intcode, read_head)
        put_elem(intcode, target, op1 + op2)
        |> calculate(read_head + 4)
      2 ->
        {op1, op2, target} = parse_block(intcode, read_head)
        put_elem(intcode, target, op1 * op2)
        |> calculate(read_head + 4)
    end
  end

  defp parse_block(intcode, read_head) do
    loc1 = elem(intcode, read_head + 1)
    loc2 = elem(intcode, read_head + 2)

    {
      elem(intcode, loc1),
      elem(intcode, loc2),
      elem(intcode, read_head + 3),
    }
  end
end
