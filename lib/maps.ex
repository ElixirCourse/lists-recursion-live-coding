defmodule Maps do
  def test(%{a: s} = m) do
    "We have a with value: #{s}. The whole map is #{m}"
  end

  def test(_) do
    "No :a key :("
  end
end
