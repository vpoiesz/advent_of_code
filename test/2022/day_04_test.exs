defmodule Day03Test do
  use ExUnit.Case
  import AOC2022.Day04, only: [
    #parse: 1,
    is_fully_contains: 1,
    is_overlap: 1,
    p1: 1,
    p2: 1
  ]

  @puzzle_dir "lib/2022/day_04/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  #test "parse", %{example_path: example_path} do
  #  IO.inspect( parse(example_path) |> Enum.to_list )
  #end

  test "is_fully_contains" do
    assert !is_fully_contains([2..4, 6..8])
    assert !is_fully_contains([2..3, 4..5])
    assert !is_fully_contains([5..7, 7..9])
    assert is_fully_contains([2..8, 3..7])
    assert is_fully_contains([6..6, 4..6])
    assert !is_fully_contains([2..6, 4..8])
  end

  test "is_overlap" do
    assert !is_overlap([2..4, 6..8])
    assert !is_overlap([2..3, 4..5])
    assert is_overlap([5..7, 7..9])
    assert is_overlap([2..8, 3..7])
    assert is_overlap([6..6, 4..6])
    assert is_overlap([2..6, 4..8])
  end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 2
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 444
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 4
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 801
  end
end
