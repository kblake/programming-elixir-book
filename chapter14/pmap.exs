defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
        # spawns processes
        spawn_link fn -> (send me, {self, fun.(elem)}) end
    end)
    |> Enum.map(fn (pid) ->
        # "executes"/receives results of process calls
        receive do { ^pid, result } -> result end
    end)
  end
end
