defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

s1 = %Subscriber{}
s2 = %Subscriber{name: "Dave"}
IO.inspect s2
s3 = %Subscriber{name: "Mary", over_18: true, paid: true}
IO.inspect s3
IO.inspect s3.name

# create new struct from exising one
s4 = %Subscriber{s3 | name: "Marie"}
IO.inspect s4
