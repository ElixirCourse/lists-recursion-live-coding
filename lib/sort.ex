defmodule List.Sort do
  @doc ~s"""
  Sorts any lsit

      iex> List.Sort.quicksort([])
      []

      iex> List.Sort.quicksort([2])
      [2]

      iex> List.Sort.quicksort([1,2,3,3,2,-1,-10,20,100,-2])
      [-10, -2, -1, 1, 2, 2, 3, 3, 20, 100]

      iex> List.Sort.quicksort([2,1,2, -1.0, 1.0, :a, "asd", 'as', %{a: 2}, [1,2,3]])
      [-1.0, 1, 1.0, 2, 2, :a, %{a: 2}, [1, 2, 3], 'as', "asd"]

      iex> List.Sort.quicksort(500_000..1 |> Enum.to_list) == 1..500_000
  """
  def quicksort([]), do: []

  def quicksort(list) when is_list(list) do
    pivot = Enum.at(list, :random.uniform(length(list)) - 1)
    {smaller, equal, larger} = partition(list, pivot)
    quicksort(smaller) ++ equal ++ quicksort(larger)
  end

  defp partition(list, pivot) do
    list
    |> Enum.reduce({[], [], []}, fn
      elem, {s, e, l} when elem < pivot ->
        {[elem | s], e, l}

      elem, {s, e, l} when elem > pivot ->
        {s, e, [elem | l]}

      elem, {s, e, l} ->
        {s, [elem | e], l}
    end)
  end
end
