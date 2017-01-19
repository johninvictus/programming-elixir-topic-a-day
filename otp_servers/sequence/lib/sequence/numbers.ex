defmodule Sequence.Numbers do
  use GenServer

  ############
  # External API
  ###########
  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next_number do
    GenServer.call __MODULE__, :next_number
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  #########################
  # GenServer implementation

  def handle_call(:next_number,from, state) do
    {:reply, state, state + 1}
  end

  def handle_cast({:increment_number, value}, state) do
    {:noreply, state + value}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end


end
