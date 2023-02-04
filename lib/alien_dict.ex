defmodule AlienDictionary do
  def is_alien_sorted(words, order) do
    do_is_alien_sorted(words, order)
  end

  def do_is_alien_sorted([_ | []], _), do: true

  def do_is_alien_sorted([w1 | [w2 | tl]], order) do
    res = in_order?(w1, w2, order)

    if res do
      is_alien_sorted([w2 | tl], order)
    else
      res
    end
  end

  def get_order_map(order), do: order |> String.graphemes() |> do_get_order_idx(%{}, 0)
  def do_get_order_idx([], map, _), do: map

  def do_get_order_idx([hd | tl], map, idx) do
    map = map |> Map.put(hd, idx)
    do_get_order_idx(tl, map, idx + 1)
  end

  def get_grapheme_idx(grapheme, order_map), do: order_map[grapheme]

  def map_graphemes_to_order(graphemes, order) do
    order_map = get_order_map(order)
    do_map_graphemes_to_order(graphemes, order_map)
  end

  def do_map_graphemes_to_order([], _), do: []

  def do_map_graphemes_to_order([hd | tl], order_map),
    do: [get_grapheme_idx(hd, order_map) | do_map_graphemes_to_order(tl, order_map)]

  def in_order?(w1, w2, order) do
    w1_graphemes_order = w1 |> String.graphemes() |> map_graphemes_to_order(order)
    w2_graphemes_order = w2 |> String.graphemes() |> map_graphemes_to_order(order)

    two_words_in_order?(w1_graphemes_order, w2_graphemes_order)
  end

  def two_words_in_order?([nil | _], [_ | _]), do: true
  def two_words_in_order?([_ | _], [nil | _]), do: false
  def two_words_in_order?([hd_w1 | _], [hd_w2 | _]) when hd_w1 < hd_w2, do: true
  def two_words_in_order?([hd_w1 | _], [hd_w2 | _]) when hd_w1 > hd_w2, do: false

  def two_words_in_order?([], _), do: true
  def two_words_in_order?(_, []), do: false

  def two_words_in_order?([_ | tl_w1], [_ | tl_w2]) do
    two_words_in_order?(tl_w1, tl_w2)
  end
end
