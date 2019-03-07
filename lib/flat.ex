defmodule Flat do
  # [1,2,3] => [1,2,3]
  # [[1,2], 3] => [1,2,3]
  # [[1,2,3,[4]], [[[[[[5]]]]]]] => [1,2,3,4,5]

  def flatten(list) when is_list(list), do: do_flatten(list) |> Enum.reverse()

  defp do_flatten(list) do
    Enum.reduce(list, [], fn
      elem, acc when is_list(elem) ->
        do_flatten(elem) ++ acc

      elem, acc ->
        [elem | acc]
    end)
  end
end
