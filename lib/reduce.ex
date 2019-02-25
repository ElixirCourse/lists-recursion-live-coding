defmodule List.Reduce do
  def foldl(list, base, fun), do: do_foldl(list, fun, base)

  def foldr(list, base, fun), do: do_foldr(list, fun, base)

  defp do_foldl([], _, result), do: result
  defp do_foldl([h | t], fun, result), do: do_foldl(t, fun, fun.(result, h))

  defp do_foldr([], _, result), do: result
  defp do_foldr([h | t], fun, result), do: fun.(h, do_foldr(t, fun, result))
end
