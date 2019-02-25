defmodule BinaryTree do
  # {:node, {key, value, smaller, larger}}

  def empty(), do: {:node, nil}

  def insert(key, value, {:node, nil}), do: {:node, {key, value, empty(), empty()}}

  def insert(new_key, new_value, {:node, {key, value, smaller, larger}})
      when new_key < key do
    {:node, {key, value, insert(new_key, new_value, smaller), larger}}
  end

  def insert(new_key, new_value, {:node, {key, value, smaller, larger}})
      when new_key > key do
    {:node, {key, value, smaller, insert(new_key, new_value, larger)}}
  end

  def insert(key, value, {:node, {key, _value, smaller, larger}}) do
    {:node, {key, value, smaller, larger}}
  end

  def lookup(_key, {:node, nil}), do: {:error, "Value not present"}

  def lookup(key, {:node, {key, value, _, _}}), do: {:ok, value}

  def lookup(key, {:node, {node_key, _value, smaller, _larger}}) when key < node_key do
    lookup(key, smaller)
  end

  # key > node_key is not needed
  def lookup(key, {:node, {node_key, _value, _smaller, larger}}) when key > node_key do
    lookup(key, larger)
  end
end
