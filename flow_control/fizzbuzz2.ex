defmodule FizzBuzz do

  # The cond macro lets you list out a series of conditions, each with associated
  # code. It executes the code corresponding to the first truthy conditions.

  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(current) do
      cond do
        rem(current, 3)== 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
  end

end
