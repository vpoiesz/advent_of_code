defmodule AOC2022.Day04 do

  def parse(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, ",", trim: true))
    |> Stream.map(&to_pair/1)
  end

  def to_pair(arr) do
    arr
    |> Enum.map(&String.split(&1, "-", trim: true))
    |> Enum.map(fn arr -> Enum.map(arr, &String.to_integer/1) end)
    |> Enum.map(&apply(Range, :new, &1))
  end

  def is_fully_contains([a,b]) do
    (a.first <= b.first) && (a.last >= b.last)
    ||
    (b.first <= a.first) && (b.last >= a.last)
  end

  def is_overlap([a,b]) do
    !Range.disjoint?(a,b)
  end

  def p1(path) do
    parse(path)
    |> Enum.map(&is_fully_contains/1)
    |> Enum.count(& &1)
  end

  def p2(path) do
    parse(path)
    |> Enum.map(&is_overlap/1)
    |> Enum.count(& &1)
  end

end
