defmodule Day06Test do
  use ExUnit.Case
  import AOC2022.Day06, only: [
    parse: 1,
    p1: 1,
    p2: 1
  ]

  @puzzle_dir "lib/2022/day_06/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example1.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  #test "parse example", %{example_path: example_path} do
  #  parse(example_path) |> IO.inspect()
  #end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 7
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 1142
  end

  test "p2 - example", %{example_path: example_path} do
    e1_path = @puzzle_dir |> Path.join("example1.txt")
    e2_path = @puzzle_dir |> Path.join("example2.txt")
    e3_path = @puzzle_dir |> Path.join("example3.txt")
    e4_path = @puzzle_dir |> Path.join("example4.txt")
    e5_path = @puzzle_dir |> Path.join("example5.txt")

    assert p2(e1_path) == 19
    assert p2(e2_path) == 23
    assert p2(e3_path) == 23
    assert p2(e4_path) == 29
    assert p2(e5_path) == 26
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 2803
  end
end
