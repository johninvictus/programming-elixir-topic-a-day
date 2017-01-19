# case lets you test a value against a set of patterns, executes the code associated
# with the first one that matches, and returns the value of that code. The pat-
# terns may include guard clauses.
defmodule Users do
  dave = %{ name: "Dave", state: "TX", like: "programming"}

  case dave do
    %{state: some_data} = person ->
      IO.puts "#{person.name} lives in #{some_data}"

      _->
      IO.puts "No matches"
  end
end
