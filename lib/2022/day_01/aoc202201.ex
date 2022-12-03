defmodule AOC2022.Day01 do

  def parse(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_by(fn line -> line != "" end)
    |> Stream.reject(fn arr -> arr == [""] end)
    |> Stream.map(fn arr -> Enum.map(arr, &String.to_integer/1) end)
    |> Stream.map(&Enum.sum/1)
  end

  def p1(path) do
    parse(path)
    |> Enum.max()

  end

  def p2(path) do
    parse(path)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

end
