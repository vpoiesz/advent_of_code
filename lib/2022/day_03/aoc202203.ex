defmodule AOC2022.Day03 do

  def parse(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)

  end

  def to_priority(char) do
    raw = :binary.decode_unsigned(char)
    cond do
      raw >= 97 -> raw - 96
      raw >= 65 -> raw - 38
    end
  end

  def p1(path) do
    parse(path)
    |> Stream.map(&String.split(&1,"", trim: true))
    |> Stream.map(fn arr -> Enum.split(arr, div(length(arr),2)) end)
    |> Stream.map(fn {arr1, arr2} -> {MapSet.new(arr1), MapSet.new(arr2)} end)
    |> Stream.map(fn {set1, set2} -> MapSet.intersection(set1, set2) end)
    |> Stream.map(fn set -> MapSet.to_list(set) |> hd() end)
    |> Stream.map(&to_priority/1)
    |> Enum.sum()
  end

  def p2(path) do
    parse(path)
    |> Stream.chunk_every(3)
    |> Stream.map(fn arr -> Enum.map(arr, &String.split(&1,"", trim: true)) end)
    |> Stream.map(fn arr -> Enum.map(arr, &MapSet.new/1) end)
    |> Stream.map(fn [ms1, ms2, ms3] -> [MapSet.intersection(ms1, ms2), ms3] end)
    |> Stream.map(fn [ms1, ms2] -> MapSet.intersection(ms1, ms2) end)
    |> Stream.map(fn set -> MapSet.to_list(set) |> hd() end)
    |> Stream.map(&to_priority/1)
    |> Enum.sum()
  end

end
