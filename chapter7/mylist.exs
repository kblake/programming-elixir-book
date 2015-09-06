defmodule MyList do
  def len([]),           do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]),            do: []
  def square([head | tail]), do: [head*head | square(tail)]

  def add_1([]),            do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]


  def map([], _func),           do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  #iex(22)> MyList.map [1,2,3], &(&1 +1)
  #[2, 3, 4]
  #iex(23)> MyList.map [1,2,3], &(&1 * 10)
  #[10, 20, 30]
  #iex(24)> MyList.map [1,2,3], &(&1 > 2) 
  #[false, false, true]


  #def sum([], total),            do: total
  #def sum([head | tail], total), do: sum(tail, head+total)

  # with accumulator
  # utilizes TCO
  # more efficient
  def sum(list),                   do: _sum(list, 0)
  defp _sum([], total),            do: total
  defp _sum([head | tail], total), do: _sum(tail, head+total)

  # without accumulator
  # not TCO-ized
  def sum2([]),            do: 0
  def sum2([head | tail]), do: head + sum2(tail)

  
  # General-purpose function that reduces a collection to a value
  def reduce([], initial_value, _func), do: initial_value
  def reduce([head | tail], initial_value, func) do
    reduce(tail, func.(head, initial_value), func)
  end

  # "sum" using reduce
  # sum_func = &(&1 + &2)
  # MyList.reduce([1,2,3,4,5], 0, sum_func)



  def mapsum([], _), do: 0
  def mapsum(list, func) do
    # sum(map(list, func))
    # becomes this... using pipe operator
    map(list, func) |> sum
  end

  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
  # 14


  # Taken from:
  # https://forums.pragprog.com/forums/322/topics/Exercise:%20ListsAndRecursion-2
  #
  # Show how values are being compared while in recursion
  def max([x]), do: x
  def max([head | tail]) do
    IO.puts head
    next = max(tail)
    IO.puts "Kernel.max(#{head},#{next})"
    Kernel.max(head, next)
  end
end
