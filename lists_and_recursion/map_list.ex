defmodule MyList do
  def map([],func), do: []
  def map([head|tail],func), do: [ func.(head)| map(tail,func) ]
end
