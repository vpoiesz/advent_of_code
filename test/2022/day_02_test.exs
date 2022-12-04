defmodule Day02Test do
  use ExUnit.Case
  import AOC2022.Day02, only: [p1: 1, p2: 1]

  @puzzle_dir "lib/2022/day_02/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 15
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 13005
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 12
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 11373
  end
end
