defmodule AddTwoNumbers do
  defmodule ListNode do
    @type t :: %__MODULE__{
            val: integer,
            next: ListNode.t() | nil
          }
    defstruct val: 0, next: nil
  end

  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2) do
    sum(l1, l2)
  end

  def sum(curr_l1 = %ListNode{next: next_l1}, curr_l2 = %ListNode{next: next_l2}) do
    %ListNode{val: curr_l1.val + curr_l2.val, next: sum(next_l1, next_l2)}
  end

  @spec count(list :: ListNode.t() | nil) :: integer
  def count(nil), do: 0

  def count(%ListNode{next: next}) do
    count = count(next) + 1
    count
  end

  def new(int) when int > 9, do: nil
  def new(int), do: %ListNode{val: int, next: nil}

  defp new, do: %ListNode{}

  @spec add(list :: ListNode.t() | nil, val :: integer()) :: ListNode.t() | nil
  def add(curr = %ListNode{next: _}, val) do
    new = new(val)
    %ListNode{new | next: curr}
  end

  @spec traverse(list :: ListNode.t() | nil) :: ListNode.t() | nil
  def traverse(nil), do: nil

  def traverse(%__MODULE__.ListNode{val: val, next: next}) do
    new = new()
    %ListNode{new | val: val, next: traverse(next)}
  end

  def element_at(list = %ListNode{val: _, next: next}, idx) do
    count = count(list)

    if count == idx + 1 do
      list
    else
      element_at(next, idx)
    end
  end
end
