defmodule List.Flatten do
  @doc ~s"""
  Flatten deeply nested lists

  ## Examples:
      iex> List.Flatten.flatten([])
      []

      iex> List.Flatten.flatten([2])
      [2]

      iex> List.Flatten.flatten([[[1]],2,3,[4,5,[6,[7,[[[8]]]]]]])
      [1,2,3,4,5,6,7,8]
  """
  def flatten(list), do: flatten(list, [])

  def flatten([h | t], result) when is_list(h) do
    flatten(h, flatten(t, result))
  end

  def flatten([h | t], result) do
    [h | flatten(t, result)]
  end

  def flatten([], result), do: result
end
