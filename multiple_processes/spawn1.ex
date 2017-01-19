defmodule Spawn1 do
  def greet do
    receive do
      { sender, message}
        -> send sender,{:ok, "Hello, #{message}"}
    end
  end
end

#here`s a client
pid = spawn(Spawn1, :greet, [])
send pid, {self, "world"}

receive do
  {:ok, message}
    -> IO.puts message
end
