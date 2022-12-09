defmodule AOC2022.Day06 do

  def parse(path) do
    File.read!(path) |> String.to_charlist()
  end

  def p1(path) do
    parse(path)
    |> find_marker(4)
  end

  def p2(path) do
    parse(path)
    |> find_marker(14)
  end

  def find_marker(data, len) do
    data
    |> Enum.reduce_while({0, []}, fn char, {pos, buffer} ->
      #IO.inspect({pos, buffer, <<char>>})
      cond do
        Enum.count(buffer) == len -> {:halt, {pos, buffer}}
        Enum.member?(buffer, char) -> {:cont, {pos + 1, shift_buffer(buffer, char)}}
        true -> {:cont, {pos + 1, buffer ++ [char]}}
      end
    end)
    #|> tap(&IO.inspect/1)
    |> elem(0)
  end

  def shift_buffer(list, target) do
    list
    |> Enum.split_while(fn char -> char != target end)
    |> elem(1)
    |> tl()
    |> Enum.concat([target])
  end

end
