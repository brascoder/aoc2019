defmodule AdventOfCode.IntcodeComputer do
  def run(intcode, input_value \\ nil) do
    read_head = 0

    intcode
    |> calculate(read_head, input_value)
  end

  defp calculate(intcode, read_head, input_value) do
    opcode = elem(intcode, read_head)
             |> parse_opcode
             |> IO.inspect

    case opcode.op do
      99 ->
        intcode
      1 ->
        add(intcode, read_head, opcode)
        |> calculate(read_head + 4, input_value)
      2 ->
        multiply(intcode, read_head, opcode)
        |> calculate(read_head + 4, input_value)
      3 ->
        input(intcode, read_head, input_value)
        |> calculate(read_head + 2, input_value)
      4 ->
        output(intcode, read_head)
        |> calculate(read_head + 2, input_value)
    end
  end

  defp add(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    put_elem(intcode, target, value1 + value2)
  end

  defp multiply(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    put_elem(intcode, target, value1 * value2)
  end

  defp input(intcode, read_head, input_value) do
    addr = elem(intcode, read_head + 1)
    put_elem(intcode, addr, input_value)
  end

  defp output(intcode, read_head) do
    addr = elem(intcode, read_head + 1)
    IO.puts elem(intcode, addr)
    intcode
  end

  defp parse_4_block(intcode, read_head, opcode) do
    addr1 = elem(intcode, read_head + 1)
    addr2 = elem(intcode, read_head + 2)

    param1 = get_param_value(intcode, Enum.at(opcode.pmodes, 0), addr1)
    param2 = get_param_value(intcode, Enum.at(opcode.pmodes, 1), addr2)
    target = elem(intcode, read_head + 3)

    {
      param1,
      param2,
      target,
    }
  end

  defp parse_opcode(op_block) do
    digits = op_block
             |> Integer.digits

    case Enum.count(digits) do
      c when c in [1, 2] -> %{op: op_block, pmodes: []}
      _ ->
        [op2, op1 | pmodes] = digits
                              |> Enum.reverse
        %{op: Integer.undigits([op1, op2]), pmodes: pmodes}
    end
  end

  defp get_param_value(intcode, pmode, addr) do
    case pmode do
      1 -> addr
      _ -> elem(intcode, addr)
    end
  end
end
