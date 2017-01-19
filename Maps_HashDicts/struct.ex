defmodule Attendee do
  @deriver Access
  defstruct [name: "", paid: false, over_18: false]

  # specific methods
  def will_attend_party(Attend = %Attendee{}) do
    Attend.paid && Attend.over_18
  end

  def print_vip_ticket(%Attendee{name: name}) when name != "" do
    IO.puts "Printing Vip ticket for #{name}"
  end

  def print_vip_ticket(%Attendee{})  do
    raise "Add name to be able to print your ticket"
  end

end
