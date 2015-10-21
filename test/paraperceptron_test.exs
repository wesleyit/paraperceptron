defmodule ParaperceptronTest do
  use ExUnit.Case
  doctest Paraperceptron

  test "The method fel is returning properly with {1, 1}." do
    assert Paraperceptron.fel({1, 1}) == 0
  end

  test "The method uel is returning properly with {3, 3}." do
    assert Paraperceptron.uel({3, 3}) == 5
  end

  test "The method output is returning properly in all cases." do
    assert Paraperceptron.output({1, 0}) == :it_is_true
    assert Paraperceptron.output({0, 1}) == :it_is_false
    assert Paraperceptron.output({1, 1}) == :it_is_inconsistent
    assert Paraperceptron.output({0.5, 0.5}) == :it_is_paracomplete
    assert Paraperceptron.output({0, 0}) == :help
  end

end

# vim: filetype=elixir tabstop=2 shiftwidth=4 expandtab
