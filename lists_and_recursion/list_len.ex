defmodule MyList do
  #Simple function to calculate length of a list
  def len([]), do: 0
  def len([_head|tail]),do: 1 + len(tail)
end
