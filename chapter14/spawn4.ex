defmodule Spawn4 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
        greet # allows this to be called as much as we want :D
    end
  end
end
