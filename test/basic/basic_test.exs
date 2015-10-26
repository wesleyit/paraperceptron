defmodule Paraperceptron.BasicTest do
  use ExUnit.Case, async: true
  doctest Paraperceptron.Basic

    test "the basic unit can return :it_is_true properly" do
      assert Paraperceptron.Basic.output(1, 0) == {:it_is_true, 1, 0}
    end

    test "the basic unit can return :it_is_false properly" do
      assert Paraperceptron.Basic.output(0, 1) == {:it_is_false, -1, 0}
    end

    test "the basic unit can return :it_is_inconsistent properly" do
      assert Paraperceptron.Basic.output(1, 1) == {:it_is_inconsistent, 0, 1}
    end

    test "the basic unit can return :it_is_paracomplete properly" do
      assert Paraperceptron.Basic.output(0, 0) == {:it_is_paracomplete, 0, -1}
    end

    test "the basic unit can return :help properly" do
      assert Paraperceptron.Basic.output(0.5, 0.5) == {:help, 0, 0}
    end

end
# vim: filetype=elixir tabstop=2 shiftwidth=2 expandtab
