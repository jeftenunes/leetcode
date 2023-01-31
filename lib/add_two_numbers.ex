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
    {val1, _} = get_val(l1) |> Enum.join("") |> Integer.parse()
    {val2, _} = get_val(l2) |> Enum.join("") |> Integer.parse()

    sum = val1 + val2
    res = sum |> to_string() |> String.graphemes() |> Enum.reverse()
    new = map(new(), res, length(res) - 1)
    new
  end

  def map(_, [], _), do: nil

  def map(curr = %__MODULE__.ListNode{next: _, val: _}, [hd | tl]) do
    {val, _} = Integer.parse(hd)
    %__MODULE__.ListNode{curr | next: map(curr, tl), val: val}
  end

  def get_val(nil), do: []

  def get_val(list) do
    [list.val | get_val(list.next)]
  end

  defp reduce_two_lists(
         %__MODULE__.ListNode{next: _, val: val1},
         nil
       ),
       do: val1

  @spec size(list :: ListNode.t() | nil) :: integer
  def size(%__MODULE__.ListNode{next: _}), do: index + 1
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
  def traverse(nil), do: []

  def traverse(curr = %__MODULE__.ListNode{val: _, next: next, index: _}) do
    traverse(next) ++ [curr]
  end
end
