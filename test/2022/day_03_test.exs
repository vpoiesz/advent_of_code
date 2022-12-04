defmodule Day03Test do
  use ExUnit.Case
  import AOC2022.Day03, only: [parse: 1, to_priority: 1, p1: 1, p2: 1]

  @puzzle_dir "lib/2022/day_03/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  #test "parse", %{example_path: example_path} do
  #  IO.inspect( parse(example_path) |> Enum.to_list, charlists: :as_lists )
  #end

  test "to_priority" do
    assert to_priority(?a) == 1
    assert to_priority(?z) == 26
    assert to_priority(?A) == 27
    assert to_priority(?Z) == 52
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
