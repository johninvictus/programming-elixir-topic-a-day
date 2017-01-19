defmodule Jsonplaceholder.CLI do

  def run(args) do
    args
    |> parse_args
    |> process
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switch: [help: :boolean],
                                      alias: [h: :help])

    case parse do

      {[help: true], _, _} ->
        :help

      {_, [ users ], _}
        -> :users

      {_, [ user, id ], _}
      -> {user, String.to_integer(id)}

      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: jsonplaceholder <user> [ id | nil ]
    """
    System.halt(0)
  end

  def process(:users) do
    
  end

  def process({user, id}) do

  end
end
