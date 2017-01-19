defmodule Weather do
  def test_data do
    [
      [2453553535, 26, 15, 0.03],
      [2424242425254, 27, 13, 0.034],
      [462879849, 20, 15, 0.34],
      [4596, 34, 15, 0.132],
      [36497262, 27, 13, 0.1221],
      [472947535537, 27, 15, 0.03],
      [4287582965632, 43, 14, 0.05],
      [428742974, 26, 13, 0.06],
      [42749284, 34, 16, 0.23],
      [4927489275248, 27, 11, 0.245]
    ]
  end

  def for_location([]), do: []

  def for_location([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location(tail)]
  end

  def for_location([ _| tail]), do: for_location(tail)
end
