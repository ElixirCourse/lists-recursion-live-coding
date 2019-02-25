defmodule RecursionTest do
  use ExUnit.Case
  doctest Recursion
  doctest List.Flatten

  test "greets the world" do
    assert Recursion.hello() == :world
  end
end
