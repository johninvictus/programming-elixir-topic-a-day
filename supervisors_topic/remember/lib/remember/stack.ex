defmodule Remember.Stack do
  use GenServer;

  #external API
  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def push_operation(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def pop_operation() do
    GenServer.call(__MODULE__, :pop)
  end

  def is_empty() do
    GenServer.call(__MODULE__, :empty)
  end

  # internal API
  def init(stash_pid) do
    current_number = Remember.Stash.get_value stash_pid
    {:ok, {current_number, stash_pid}}
  end

  def handle_cast({:push, value}, {current_number, stash_pid}) do
    {:noreply, { [value|current_number], stash_pid} }
  end

  def handle_call(:pop, _from, {[head|tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end

  def handle_call(:empty, _from, {[], stash_pid}) do
    {:reply, :true, {[], stash_pid} }
  end

  def handle_call(:empty, _from, {state, stash_pid}) do
    {:reply, :false,  {state, stash_pid} }
  end

  def terminate(_reason, {current_state, stash_pid}) do
    Remember.Stash.save_value stash_pid, current_state
  end
end
