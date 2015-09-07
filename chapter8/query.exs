defmodule Village do
  @people [
    %{ name: "Grumpy",    height: 1.24 },
    %{ name: "Dave",      height: 1.88 },
    %{ name: "Dopey",     height: 1.32 },
    %{ name: "Shaquille", height: 2.16 },
    %{ name: "Sneezy",    height: 1.28 }
  ]

  def people, do: @people
end

for person = %{ height: height } <- Village.people, height > 1.5 do
  IO.inspect person
end
