defmodule Day07Test do
  use ExUnit.Case
  import AOC2022.Day07, only: [
    parse: 1,
    p1: 1,
    p2: 1
  ]

  @puzzle_dir "lib/2022/day_07/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  #test "parse example", %{example_path: example_path} do
  #  parse(example_path) |> IO.inspect()
  #end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 95437
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 1611443
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 24933642
  end

  test "p2 - input", %{input_path: input_path} do
    p2(input_path) |> IO.inspect()
    assert p2(input_path) == 2086088
  end
end
