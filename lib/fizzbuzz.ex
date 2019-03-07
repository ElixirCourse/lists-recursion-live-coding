defmodule FizzBuzz.Lame do
  def fizzbuzz(n), do: fizzbuzz(1, n + 1)

  def fizzbuzz(n, n), do: :ok

  def fizzbuzz(m, n) when rem(m, 3) == 0 and rem(m, 5) == 0 do
    "fizzbuzz" |> IO.puts()
    fizzbuzz(m + 1, n)
  end

  def fizzbuzz(m, n) when rem(m, 3) == 0 do
    "fizz" |> IO.puts()
    fizzbuzz(m + 1, n)
  end

  def fizzbuzz(m, n) when rem(m, 5) == 0 do
    "buzz" |> IO.puts()
    fizzbuzz(m + 1, n)
  end

  def fizzbuzz(m, n) do
    IO.puts(m)
    fizzbuzz(m + 1, n)
  end
end

defmodule FizzBuzz do
  def fizzbuzz(n) when is_integer(n) and n > 0,
    do: Enum.map(1..n, &f(rem(&1, 3), rem(&1, 5), &1))

  defp f(0, 0, _), do: "FizzBuzz"
  defp f(0, _, _), do: "Fizz"
  defp f(_, 0, _), do: "Buzz"
  defp f(_, _, n), do: n
end
