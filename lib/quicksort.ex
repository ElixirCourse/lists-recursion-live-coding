defmodule QSort do
  def quicksort([pivot | rest]) do
    {smaller, larger} = partition(rest, pivot)
    quicksort(smaller) ++ [pivot] ++ quicksort(larger)
  end

  defp partition(list, pivot) do
    list
    |> Fold.foldl({[], []}, fn
      elem, {smaller, larger} when elem <= pivot -> {[elem | smaller], larger}
      elem, {smaller, larger} when elem > pivot -> {smaller, [elem | larger]}
    end)
  end
end
