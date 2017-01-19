defmodule Spawn3 do

  # dealing with multiple process
  # using loop
  def greet do
    receive do
      {sender, message}
        -> send sender, {:ok, "Hello #{message}"}
        # prevent terminating the process after receiveing the message
        # tail-call optimization.
        # But beware—the recursive call must be the very last thing executed
           greet
    end
  end
end

pid = spawn(Spawn3, :greet, [])
send pid, {self, "World"}

# receive the first greeting
# It will terminate after receiving the message

receive do
  {:ok, message}
    -> IO.puts message
end

send pid, {self, "Kenya"}

receive do
  {:ok, message}
    -> IO.puts message

  after 500
    -> IO.puts  "process wait timeout"
end
