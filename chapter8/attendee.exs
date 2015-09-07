defmodule Attendee do
  @derive Access
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

# Sample run:
#iex(33)> a1 = %Attendee{name: "Dave", over_18: true}
#%Attendee{name: "Dave", over_18: true, paid: false}
#iex(34)> Attendee.may_attend_after_party(a1)
#false
#iex(35)> a2 = %Attendee{a1 | paid: true}
#%Attendee{name: "Dave", over_18: true, paid: true}
#iex(36)> Attendee.may_attend_after_party(a2)
#true
#iex(37)> Attendee.print_vip_badge(a2)
#Very cheap badge for Dave
#:ok
#iex(38)> a3 = %Attendee{}
#%Attendee{name: "", over_18: true, paid: false}
#iex(39)> Attendee.print_vip_badge(a3)
#** (RuntimeError) missing name for badge
    #attendee.exs:13: Attendee.print_vip_badge/1

# derive Access protocol (map api)
#iex(40)> a = %Attendee{name: "Karmen"}
#%Attendee{name: "Karmen", over_18: true, paid: false}
#iex(41)> a[:name]
#"Karmen"
