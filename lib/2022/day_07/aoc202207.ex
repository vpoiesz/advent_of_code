defmodule AOC2022.Day07 do

  def parse(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.reduce(%{cwd: [""], tree: %{"/" => 0}}, fn line, acc ->
      parse_line(line, acc)
    end)
    |> Map.get(:tree)
  end

  def parse_line(<<"$ cd ", dir::binary>>, acc) do
    %{acc | cwd: do_cd(acc.cwd, dir)}
  end

  def parse_line(<<"$ ls">>, acc) do
    acc
  end

  def parse_line(<<"dir ", dir::binary>>, acc) do
    %{acc | tree: Map.put(acc.tree, render_path(acc.cwd, dir), 0)}
  end

  def parse_line(file, acc) do
    [size, name] = String.split(file)
    %{acc | tree: Map.put(acc.tree, render_path(acc.cwd, name), String.to_integer(size))}
  end

  defp do_cd([cwd | parents], dir) do
    case dir do
      "/" -> [""]
      ".." -> parents
      dir -> [dir, cwd | parents]
    end
  end

  defp render_path(dir, file) do
    [file | dir] |> Enum.reverse() |> Enum.join("/")
  end

  def p1(path) do
    dir_sizes = parse(path) |> dir_sizes()
    Enum.filter(dir_sizes, fn size -> size <= 100_000 end)
    |> Enum.sum()
  end

  def p2(path) do
    tree = parse(path)

    space_total_disk = 70_000_000
    space_currently_used = tree |> Map.values() |> Enum.sum()
    space_currently_unused = space_total_disk - space_currently_used
    space_unused_required = 30_000_000
    space_extra_required = space_unused_required - space_currently_unused

    dir_sizes = parse(path) |> dir_sizes()
    candidate_dirs = Enum.filter(dir_sizes, fn size -> size >= space_extra_required end)

    Enum.min(candidate_dirs)
  end

  def dir_sizes(tree) do
    dirs = Map.filter(tree, fn {_, size} -> size == 0 end) |> Map.keys()
    Enum.map(dirs, fn dir ->
      tree
      |> Map.filter(fn {name, _} -> String.starts_with?(name, dir <> "/") end)
      |> Enum.reduce(0, fn {_, size}, total -> total + size end)
    end)
  end

end
