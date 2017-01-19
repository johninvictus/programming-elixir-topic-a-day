defmodule MyList do

  def max(list) do
    _max(list, 0)
  end

  defp _max([], largest) do
    largest
  end

  defp _max([head|tail], largest) when head > largest do
    _max(tail, head)
  end

  defp _max([head|tail], largest) when head < largest do
    _max(tail, largest)
  end

end
