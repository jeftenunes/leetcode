defmodule Palindrome do
  def is_palindrome(""), do: true
  def is_palindrome(nil), do: false

  def is_palindrome(str) do
    init_idx = 0
    last_idx = String.length(str) - 1

    if String.first(str) == String.last(str) do
      init_idx = init_idx + 1
      last_idx = last_idx - 1
      is_palindrome(String.slice(str, init_idx..last_idx))
    else
      false
    end
  end
end
