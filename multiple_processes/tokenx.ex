defmodule Token do

  def create(next_pid) do
    receive do
      message
        ->  send next_pid, {:ok, message}
    end
  end

  def wait(send_to,message) do
    send send_to, message
    receive do
      {:ok, message}
        ->  IO.puts message
    end
  end


  def run(lists) do
    for l <- lists do
      pid = spawn(Token, :create, [self])
      wait(pid, l)
    end
  end
end
