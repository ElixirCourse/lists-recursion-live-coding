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
  """
  def quicksort([]), do: []

  def quicksort([pivot | t]) do
    {smaller, larger} = partition(t, pivot)
    quicksort(smaller) ++ [pivot] ++ quicksort(larger)
  end

  defp partition(list, pivot) do
    list
    |> Enum.reduce({[], []}, fn
      elem, {smaller, larger} when elem <= pivot ->
        {[elem | smaller], larger}

      elem, {smaller, larger} ->
        {smaller, [elem | larger]}
    end)
  end
end
