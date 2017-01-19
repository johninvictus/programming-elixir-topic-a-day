defmodule Sequence.Stack do
  use GenServer

  def handle_call(:pop, _from, []), do: raise "Empty stack"

  #accessed using call
  def handle_call(:pop, _from,   [head|tail]) do
    {:reply, head, tail}
  end

  # when we dont need a rely
  #accessed using cast
  def handle_cast({:push, value}, state) do
    {:noreply, [value|state]}
  end

end
