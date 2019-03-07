defmodule List.Reduce do
  # foldl -> (1,2,3,4), 0, - => 4 - (3 - (2 - (1 - 0)))
  #  => 4 - (3 - (2 - 1) => 4 - (3 - 1)) => 4 - 2 = 2

  # foldr -> (1,2,3,4), 0, - => (1 - (2 - (3 - 4)))
  #  => 1 - (2 - -1) => 1 - 3 => -2
  def foldl([], result, _), do: result

  def foldl([h | t], result, fun) do
    foldl(t, fun.(h, result), fun)
  end

  def foldr([], result, _), do: result
  def foldr([h | t], result, fun), do: fun.(h, foldr(t, result, fun))
end
