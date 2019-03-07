defmodule BTree do
  # {:node, {key, value, smaller, larger}}

  def new(), do: empty()

  def empty(), do: {:node, nil}

  def insert(tree, key, value)

  def insert({:node, nil}, key, value) do
    {:node, {key, value, empty(), empty()}}
  end

  def insert({:node, {node_key, node_value, smaller, larger}}, key, value)
      when key > node_key do
    {:node, {node_key, node_value, smaller, insert(larger, key, value)}}
  end

  def insert({:node, {node_key, node_value, smaller, larger}}, key, value)
      when key < node_key do
    {:node, {node_key, node_value, insert(smaller, key, value), larger}}
  end

  def insert({:node, {key, _node_value, smaller, larger}}, key, value) do
    {:node, {key, value, smaller, larger}}
  end

  def lookup({:node, nil}, _), do: {:error, "NO value found"}

  def lookup({:node, {node_key, _value, smaller, _larger}}, key) when key < node_key do
    lookup(smaller, key)
  end

  def lookup({:node, {node_key, _value, _smaller, larger}}, key) when key > node_key do
    lookup(larger, key)
  end

  def lookup({:node, {key, value, _smaller, _larger}}, key) do
    {:ok, value}
  end
end
