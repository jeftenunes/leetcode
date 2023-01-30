defmodule AddTwoNumbers do
  defmodule ListNode do
    @type t :: %__MODULE__{
            val: integer,
            index: integer,
            next: ListNode.t() | nil
          }
    defstruct val: 0, index: 0, next: nil
  end

  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2) do
    reduce_two_lists(l1, l2)
  end

  defp reduce_two_lists(
         %__MODULE__.ListNode{next: next1, index: _, val: val1},
         %__MODULE__.ListNode{next: next2, index: _, val: val2}
       ) do
    [val1 + val2 | reduce_two_lists(next1, next2)]
  end

  defp reduce_two_lists(
         nil,
         nil
       ),
       do: []

  defp reduce_two_lists(
         %__MODULE__.ListNode{next: _, index: _, val: val1},
         nil
       ),
       do: val1

  @spec size(list :: ListNode.t() | nil) :: integer
  def size(%__MODULE__.ListNode{next: _, index: index}), do: index + 1
  def new(int) when int > 9, do: nil
  def new(int), do: %__MODULE__.ListNode{val: int}

  defp new, do: %__MODULE__.ListNode{}

  @spec element_at(list :: ListNode.t() | nil, idx :: integer) :: integer | nil
  def element_at(curr = %__MODULE__.ListNode{next: _, index: _}, idx) do
    if curr.index == idx do
      curr
    else
      element_at(curr.next, idx)
    end
  end

  @spec add(list :: ListNode.t() | nil, val :: integer()) :: ListNode.t() | nil
  def add(curr = %__MODULE__.ListNode{next: _, index: index}, val)
      when index + 1 >= 100 or (val < 0 or val > 9),
      do: curr

  def add(curr = %__MODULE__.ListNode{next: _, index: index}, val) do
    new = new(val)
    %__MODULE__.ListNode{new | next: curr, index: index + 1}
  end

  @spec reverse(list :: ListNode.t() | nil) :: ListNode.t() | nil
  def reverse(nil), do: nil

  def reverse(%__MODULE__.ListNode{val: val, next: next, index: index}) do
    new = new()
    %__MODULE__.ListNode{new | val: val, index: index, next: reverse(next)}
  end

  @spec traverse(list :: ListNode.t() | nil) :: ListNode.t() | nil
  def traverse(nil), do: nil

  def traverse(list = %__MODULE__.ListNode{next: next, index: index}) do
  end
end
