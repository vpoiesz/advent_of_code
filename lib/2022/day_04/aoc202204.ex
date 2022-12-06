defmodule AOC2022.Day04 do

  def parse(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_pair/1)
  end

  def parse_pair(line) do
    line
    |> String.split(",", trim: true)
    |> then(fn [left, right] -> {parse_elf(left), parse_elf(right)} end)
  end

  def parse_elf(str) do
    str
    |> String.split("-")
    |> then(fn [first, last] -> String.to_integer(first)..String.to_integer(last) end)
  end

  def is_fully_contains({first1..last1, first2..last2}) do
    first1 >= first2 and last1 <= last2 or
    first2 >= first1 and last2 <= last1
  end

  def is_overlap({a,b}) do
    not Range.disjoint?(a,b)
  end

  def solve(path, filter) do
    parse(path)
    |> Enum.map(filter)
    |> Enum.count(& &1)
  end

  def p1(path) do
    solve(path, &is_fully_contains/1)
  end

  def p2(path) do
    solve(path, &is_overlap/1)
  end

end
