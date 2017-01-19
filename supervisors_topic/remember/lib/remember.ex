defmodule Remember do
  use Application

  def start(_start_type, start_args) do
    {:ok, _pid} = Remember.Supervisor.start_link [start_args]
  end

end
