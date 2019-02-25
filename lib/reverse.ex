defmodule List.Reverse do
  def reverse(list), do: reverse(list, [])

  defp reverse([], result), do: result
  defp reverse([h | t], result), do: reverse(t, [h | result])
end
