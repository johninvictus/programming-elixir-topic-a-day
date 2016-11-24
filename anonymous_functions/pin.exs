defmodule Greeter do
  def for(name,greeting) do
    fn (^name) -> "#{greeting} #{name}"
          (_) -> "Do i know you ?"
    end
  end
end

mr_john = Greeter.for("John","Hello")
# will return the anonymous function

#out put the values
# output will be the welcome message because it has matched
IO.puts mr_john.("John")

# the output will ask Do i know you?
IO.puts mr_john.("ken")
