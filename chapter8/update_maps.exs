m = %{a: 1,b: 2,c: 3}
IO.inspect m # %{a: 1, b: 2, c: 3}

m1 = %{m | b: "two", c: "three"}
IO.inspect m1 # %{a: 1, b: "two", c: "three"}

m2 = %{ m1 | a: "one"}
IO.inspect m2  # %{a: "one", b: "two", c: "three"}
