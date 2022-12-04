defmodule Day03Test do
  use ExUnit.Case
  import AOC2022.Day03, only: [parse: 1, char_to_int: 1, p1: 1, p2: 1]

  @puzzle_dir "lib/2022/day_03/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  test "char_to_int" do
    assert char_to_int("a") == 1
    assert char_to_int("z") == 26
    assert char_to_int("A") == 27
    assert char_to_int("Z") == 52
  end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 157
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 7691
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 70
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 2508
  end
end
