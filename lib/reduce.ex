defmodule List.Reduce do
  def foldl([], result, _), do: result
  def foldl([h | t], result, fun), do: foldl(t, fun.(h, result), fun)
  def foldr([], result, _), do: result
  def foldr([h | t], result, fun), do: fun.(h, foldr(t, result, fun))
end
