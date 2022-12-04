defmodule Day01Test do
  use ExUnit.Case
  import AOC2022.Day01, only: [p1: 1, p2: 1]

  @puzzle_dir "lib/2022/day_01/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 24000
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 71300
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 45000
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 209691
  end
end
