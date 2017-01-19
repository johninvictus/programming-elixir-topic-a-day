defmodule MyList do
  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1 | add_1(tail) ]
end
