defmodule List.Sort do
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
