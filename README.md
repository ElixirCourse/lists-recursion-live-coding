# Recursion

`.` vs pattern matching - access protocol vs pattern matching

---

foo.bar expands to:

case foo do
  %{bar: bar} -> bar
  %{} -> :erlang.raise({:badkey, :bar, foo})
end

---

Maps have actually two representations depending on the size. Small maps (less than 32 keys) are represented as two sorted arrays - one for keys and one for values. Accessing a key in such a map involves a linear search (and a linear search is much faster than a binary search since the size is so small). Depending on how you look at it, you might say that’s O(n) since it depends on the map size, or O(1) since the worst case is O(32), which is O(1) - the big O notation is not very helpful when talking about small data structures, especially with cache locality and branch prediction effects, you can get significantly different results from what you’d expect by a simple complexity analysis.

Large maps are represented as HAMT and the access is O(log n) - the “forking” factor of the maps is 32, so even very big maps are rather shallow and rarely involve more than 3 levels (32k items).

---

## IO.puts does not work for maps

1. myths, http://erlang.org/doc/efficiency_guide/myths.html
2. tc is not a silver bullet - https://ferd.ca/erlang-s-tail-recursion-is-not-a-silver-bullet.html
3. list handling - http://erlang.org/doc/efficiency_guide/listHandling.html#id64754
