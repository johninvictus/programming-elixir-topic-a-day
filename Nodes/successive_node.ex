defmodule Server do

  @interval 2000 #2 seconds
  @server_pid :server

  def start do
    pid = spawn(__MODULE__, :generate, [[]])
    :global.re_register_name(@server_pid, pid)
  end

  def register(client_id) do
    send :global.whereis_name(@server_pid), {:register, client_id}
  end

  def generate(clients) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        sender([pid|clients], 0)

      after @interval ->
        IO.puts "please add client"
        generate(clients)
    end
  end

  def sender(clients, currentPosition) do
    receive do
      {:register, pid} ->
          IO.puts "registering from sender #{inspect pid}"
          sender([pid|clients], currentPosition)

      after @interval ->
        IO.puts "Inside the looper position: #{currentPosition} length: #{inspect length(clients)} clients: #{inspect clients}"

        #bug called only once
        cond do
          length(clients) == 1 and currentPosition == 0 ->
          send Enum.at(clients, currentPosition), {:tick}
          sender(clients, currentPosition)

          length(clients) > 1 and currentPosition+ 1 != length(clients) ->
          send Enum.at(clients, currentPosition), {:tick}
          sender(clients, currentPosition + 1)

          length(clients) > 1 and currentPosition+ 1 == length(clients) ->
          send Enum.at(clients, currentPosition), {:tick}
          sender(clients, 0)
        end
    end
  end

end

defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Server.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
      IO.puts "tock in client"
      receiver
    end
  end

end
