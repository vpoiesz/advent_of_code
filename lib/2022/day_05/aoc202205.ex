defmodule AOC2022.Day05 do

  def parse(path) do
    [diagram, instructions] = String.split(File.read!(path), "\n\n")
    {parse_crates(diagram), parse_instructions(instructions)}
  end

  def parse_crates(diagram) do
    diagram
    |> String.split("\n")
    |> Enum.drop(-1)
    |> Enum.reverse()
    |> Enum.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.chunk_every(4)
      |> Enum.map(fn arr -> Enum.at(arr, 1) end)
      |> Enum.map(fn char -> char |> String.to_charlist() |> hd() end)
    end)
    |> crates_to_stacks()
  end

  def crates_to_stacks(crates_matrix) do
    for(
      row <- crates_matrix,
      {crate, stack_index} <- Enum.with_index(row),
      crate >= ?A,
      #do: {stack + 1, <<crate>>}
      reduce: %{})
      do
        acc -> Map.update(acc, stack_index + 1, [crate], fn arr -> [crate | arr] end)
    end
  end

  def parse_instructions(instructions) do
    instructions
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_move/1)
  end

  def parse_move(move) do
    ~r/move (\d+) from (\d+) to (\d+)/
    |> Regex.run(move)
    |> tl()
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def p1(path) do
    {stacks, moves} = parse(path)
    do_moves_p1(stacks, moves)
    |> get_tops()
  end

  def p2(path) do
    {stacks, moves} = parse(path)
    do_moves_p2(stacks, moves)
    |> get_tops()
    |> tap(&IO.inspect/1)
  end

  def do_moves_p1(stacks, []), do: stacks
  def do_moves_p1(stacks, [{num, from, to} | moves]) do
    Enum.reduce(1..num, stacks, fn _, stacks ->
      stacks
      |> Map.update!(from, fn [_ | tail] -> tail end)
      |> Map.update!(to, fn stack -> [stacks[from] |> hd() | stack] end)
    end)
    |> do_moves_p1(moves)
  end

  def do_moves_p2(stacks, steps) do
    Enum.reduce(steps, stacks, fn {num, from, to}, stacks ->
      {crates_to_move, stacks} = Map.get_and_update!(stacks, from, fn stack -> Enum.split(stack, num) end)
      stacks |> Map.update!(to, fn to_stack -> crates_to_move ++ to_stack end)
    end)
  end

  def get_tops(stacks) do
    Enum.map(stacks, fn {_, [top | _]} -> top end)
  end

end
