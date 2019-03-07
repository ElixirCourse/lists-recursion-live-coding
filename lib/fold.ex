defmodule Fold do
  # foldl -> (1,2,3,4), 8, - => 4 - (3 - (2 - (1 - 0)))
  #  => 4 - (3 - (2 - 1) => 4 - (3 - 1)) => 4 - 2 = 2

  # foldr -> (1,2,3,4), 0, - => (1 - (2 - (3 - (4 - 0)))
  #  => 1 - (2 - -1) => 1 - 3 => -2

  def foldl([], acc, _fun), do: acc
  def foldl([h | t], acc, fun), do: foldl(t, fun.(h, acc), fun)

  def foldr([], acc, _fun), do: acc
  def foldr([h | t], acc, fun), do: fun.(h, foldr(t, acc, fun))
end
