defmodule TwoSum do
  @moduledoc """
  Documentation for `TwoSum`.
  """

  @doc """
  Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
  You may assume that each input would have exactly one solution, and you may not use the same element twice.
  You can return the answer in any order.
  ## Examples

      iex> TwoSum.two_sum([1, 2, 3], 3)
      [0,1]

  """

  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    indexed = Enum.zip(0..length(nums), nums)
    indexed |> find_two_sum(target)
  end

  def find_two_sum([], _), do: nil

  def find_two_sum(enumerable, target) do
    res = enumerable |> compare(target)

    if res != [] do
      res
    else
      tl(enumerable) |> find_two_sum(target)
    end
  end

  def compare([_ | []], _), do: []

  def compare([curr | rest], target) do
    {curr_ix, curr_val} = curr
    {next_ix, next_val} = hd(rest)

    if curr_val + next_val == target do
      [curr_ix, next_ix]
    else
      compare([curr | tl(rest)], target)
    end
  end
end
