defmodule Deterministic do
  def something do
    receive do
      {sender, token} ->
        send sender, token
    end
  end

  def create_processes do
    pid1 = spawn(Deterministic, :something, [])
    pid2 = spawn(Deterministic, :something, [])

    send pid1, {self, "fred"}
    send pid2, {self, "betty"}

    receive do
      token ->
        IO.puts token
    end
  end
end
