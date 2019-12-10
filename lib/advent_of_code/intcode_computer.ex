defmodule AdventOfCode.IntcodeComputer do
  @input nil

  def run(intcode, input \\ nil) do
    read_head = 0
    if input, do: @input = input

    intcode
    |> calculate(read_head)
  end

  defp calculate(intcode, read_head) do
    opcode = elem(intcode, read_head)
             |> parse_op_block

    case opcode do
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

  defp parse_op_block(op_block) do
    opcode = op_block
             |> String.split(",")
             |> Enum.reverse
  end

  defp parse_block(intcode, read_head) do
    optcode = elem(intcode, read_head)
    loc1 = elem(intcode, read_head + 1)
    loc2 = elem(intcode, read_head + 2)

    {
      elem(intcode, loc1),
      elem(intcode, loc2),
      elem(intcode, read_head + 3),
    }
  end
end
