defmodule AOC2022.Day03 do

  def parse(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_charlist/1)
  end

  def to_priority(char) do
    cond do
      char <= ?Z -> char - ?A + 27
      char >= ?a -> char - ?a + 1
    end
  end

  def find_common(rucksacks) do
    rucksacks
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> MapSet.to_list()
    |> hd()
    |> to_priority()
  end

  def p1(path) do
    parse(path)
    |> Stream.map(fn arr -> Enum.chunk_every(arr, div(length(arr),2)) end)
    |> Stream.map(&find_common/1)
    |> Enum.sum()
  end

  def p2(path) do
    parse(path)
    |> Stream.chunk_every(3)
    |> Stream.map(&find_common/1)
    |> Enum.sum()
  end

end
