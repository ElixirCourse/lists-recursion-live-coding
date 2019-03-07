defmodule FB do
  def quicksort([]), do: []

  def quicksort(list) do
    pivot = Enum.at(list, :rand.uniform(length(list)) - 1)
    {smaller, equal, larger} = partition(list, pivot)
    quicksort(smaller) ++ equal ++ quicksort(larger)
  end

  def partition(list, pivot) do
    list
    |> Enum.reduce({[], [], []}, fn
      elem, {s, e, l} when elem > pivot ->
        {s, e, [elem | l]}

      elem, {s, e, l} when elem < pivot ->
        {[elem | s], e, l}

      elem, {s, e, l} ->
        {s, [elem | e], l}
    end)
  end
end
