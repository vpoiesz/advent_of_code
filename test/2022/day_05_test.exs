defmodule Day05Test do
  use ExUnit.Case
  import AOC2022.Day05, only: [
    parse: 1,
    p1: 1,
    p2: 1
  ]

  @puzzle_dir "lib/2022/day_05/"
  setup_all do
    {:ok,
     [
       example_path: @puzzle_dir |> Path.join("example.txt"),
       input_path: @puzzle_dir |> Path.join("input.txt")
     ]}
  end

  test "parse example", %{example_path: example_path} do
    assert parse(example_path) ===
             {%{1 => [?N, ?Z], 2 => [?D, ?C, ?M], 3 => [?P]},
              [{1, 2, 1}, {3, 1, 3}, {2, 2, 1}, {1, 1, 2}]}
  end

  test "p1 - example", %{example_path: example_path} do
    assert p1(example_path) == 'CMZ'
  end

  test "p1 - input", %{input_path: input_path} do
    assert p1(input_path) == 'ZRLJGSCTR'
  end

  test "p2 - example", %{example_path: example_path} do
    assert p2(example_path) == 'MCD'
  end

  test "p2 - input", %{input_path: input_path} do
    assert p2(input_path) == 'PRTTGRFPB'
  end
end
