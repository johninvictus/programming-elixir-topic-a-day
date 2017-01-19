defmodule Remember.Supervisor do
use Supervisor

# we start the supervisor
def start_link(initial_state) do
  result = {:ok, sub} = Supervisor.start_link(__MODULE__, [initial_state])
  start_workers(sub, initial_state)
  result
end

def start_workers(sub, initial_number) do
  {:ok, stash} =
    Supervisor.start_child(sub, worker(Remember.Stash, [initial_number]))

    #and then the subsupervisor for the actual sequence server
    Supervisor.start_child(sub, worker(Remember.SubSupervisor, [stash]))
end

# this will automatically be call after starting supervisor at line 6
def init(_) do
  supervise [], strategy: :one_for_one
end

end
