defmodule List.Map do
  def map([], _), do: []
  def map([h | t], fun), do: [fun.(h) | map(t, fun)]

  def rmap(list, fun) do
    list
    |> List.Reduce.foldr([], fn elem, acc ->
      [fun.(elem) | acc]
    end)
  end

  def lmap(list, fun) do
    list
    |> List.Reduce.foldl([], fn elem, acc ->
      [fun.(elem) | acc]
    end)
    |> List.Reverse.reverse()
  end

  def emap(list, fun) do
    list
    |> Enum.reduce([], fn elem, acc ->
      [fun.(elem) | acc]
    end)
    |> Enum.reverse()
  end
end
