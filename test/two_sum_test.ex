defmodule TwoSumTest do
  use ExUnit.Case
  doctest TwoSum

  test "when user inputs the list [1, 2, 3, 4, 5] and the target 8, answers [2, 4]" do
    assert TwoSum.two_sum([1, 2, 3, 4, 5], 8) == [2, 4]
  end

  test "when user inputs the list [3, 0, 3] and the target 6, answers [0, 2]" do
    assert TwoSum.two_sum([3, 0, 3], 6) == [0, 2]
  end
end
