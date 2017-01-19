defmodule Chop do
  def guess(actual, range = low..high) do
    g = div(low+high, 2)
    IO.puts "It is #{g}"
    _guess(actual, g, range)
  end

  defp _guess(actual, actual, _) do
    actual
  end

  defp _guess(actual, guess, _low..high) when guess < actual  do
    guess(actual,guess+1..high)
  end

  defp _guess(actual, guess, low.._high) when guess > actual do
    guess(actual,low..guess-1)
  end
end
