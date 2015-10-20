# encoding: UTF-8
# vim: filetype=elixir

defmodule ElixirParaperceptronTest do
  use ExUnit.Case
  doctest ElixirParaperceptron

  test "The method fel is returning properly with {1, 1}." do
    assert ElixirParaperceptron.fel({1, 1}) == 0
  end

	test "The method uel is returning properly with {3, 3}." do
    assert ElixirParaperceptron.uel({3, 3}) == 5
  end

	test "The method output is returning properly in all cases." do
		assert ElixirParaperceptron.output({1, 0}) == :true
		assert ElixirParaperceptron.output({0, 1}) == :false
		assert ElixirParaperceptron.output({1, 1}) == :inconsistent
		assert ElixirParaperceptron.output({0.5, 0.5}) == :paracomplete
		assert ElixirParaperceptron.output({0, 0}) == :help
	end

end
