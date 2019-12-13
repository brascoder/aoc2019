defmodule AdventOfCode.IntcodeComputer do
  def run(intcode, input_value \\ nil) do
    read_head = 0

    intcode
    |> calculate(read_head, input_value)
  end

  defp calculate(intcode, read_head, input_value) do
    opcode = elem(intcode, read_head)
             |> parse_opcode

    case opcode.op do
      99 ->
        intcode
      1 ->
        {new_intcode, target} = add(intcode, read_head, opcode)
        calculate_next(new_intcode, target, read_head, 4, input_value)
      2 ->
        {new_intcode, target} = multiply(intcode, read_head, opcode)
        calculate_next(new_intcode, target, read_head, 4, input_value)
      3 ->
        {new_intcode, target} = input(intcode, read_head, input_value)
        calculate_next(new_intcode, target, read_head, 2, input_value)
      4 ->
        output(intcode, read_head, opcode)
        |> calculate(read_head + 2, input_value)
      5 ->
        new_read_head = jump_if_true(intcode, read_head, opcode)
        calculate(intcode, new_read_head, input_value)
      6 ->
        new_read_head = jump_if_false(intcode, read_head, opcode)
        calculate(intcode, new_read_head, input_value)
      7 ->
        {new_intcode, target} = less_than(intcode, read_head, opcode)
        calculate_next(new_intcode, target, read_head, 4, input_value)
      8 ->
        {new_intcode, target} = equal(intcode, read_head, opcode)
        calculate_next(new_intcode, target, read_head, 4, input_value)
    end
  end

  defp calculate_next(new_intcode, target, read_head, move, input_value) do
    if target == read_head do
      calculate(new_intcode, read_head, input_value)
    else
      calculate(new_intcode, read_head + move, input_value)
    end
  end

  defp add(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    {put_elem(intcode, target, value1 + value2), target}
  end

  defp multiply(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    {put_elem(intcode, target, value1 * value2), target}
  end

  defp input(intcode, read_head, input_value) do
    target = elem(intcode, read_head + 1)
    {put_elem(intcode, target, input_value), target}
  end

  defp output(intcode, read_head, opcode) do
    target = parse_2_block(intcode, read_head, opcode)
    IO.puts target
    intcode
  end

  defp jump_if_true(intcode, read_head, opcode) do
    {result, target} = parse_3_block(intcode, read_head, opcode)
    if result == 0 do
      read_head + 3
    else
      target
    end
  end

  defp jump_if_false(intcode, read_head, opcode) do
    {result, target} = parse_3_block(intcode, read_head, opcode)
    if result != 0 do
      read_head + 3
    else
      target
    end
  end

  defp less_than(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    if value1 < value2 do
      {put_elem(intcode, target, 1), target}
    else
      {put_elem(intcode, target, 0), target}
    end
  end

  defp equal(intcode, read_head, opcode) do
    {value1, value2, target} = parse_4_block(intcode, read_head, opcode)
    if value1 == value2 do
      {put_elem(intcode, target, 1), target}
    else
      {put_elem(intcode, target, 0), target}
    end
  end

  defp parse_2_block(intcode, read_head, opcode) do
    addr = elem(intcode, read_head + 1)
    get_param_value(intcode, Enum.at(opcode.pmodes, 0), addr)
  end

  defp parse_3_block(intcode, read_head, opcode) do
    addr1 = elem(intcode, read_head + 1)
    param1 = get_param_value(intcode, Enum.at(opcode.pmodes, 0), addr1)
    target = elem(intcode, read_head + 2)

    {
      param1,
      target,
    }
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
