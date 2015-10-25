defmodule Paraperceptron.Decision do
  import Paraperceptron  
  @moduledoc """
  The decision unity of a Paraperceptron Artificial Neural Net.
  This is usually the last node of the network, responsible for
  providing the output values, which can be 1 for true, 
  0 for false and 0.5 for indefinition.
  Wesley Rodrigues <wesley.it@gmail.com>
  """

  ## The default values for decision and contradiction:
  @default_factors [dtf: 0.5, ctf: 0.5]

  @doc """
  Get the calculated output, which is a decision.
  The factors it needs to get a valid response are:
  - dtf - decision tolerance factor
  - ctf - contradiction tolerance factor
  There is a basic equation used to get the calculated favorable level:
  - rtl - basic structural equation
  Usage:
  output(mi, lambda), where mi and lambda are numbers 
  between 0 and 1.
  It returns a number that can be 0, 0.5 or 1, which is the main output, 
  or the atom :help indicating problems. 
  """
  def output(mi, lambda, factors \\ @default_factors) do
    mir = rtl(mi, lambda)
    t_limit = f_limit = limit_values(factors[:dtf])
    this_uel = uel(mi, lambda)
    cond do 
      this_uel >= factors[:ctf] -> :help
      mir <= f_limit -> 0
      mir <= t_limit && mir >= f_limit -> 0.5
      mir >= t_limit -> 1
    end
  end

end
# vim: filetype=elixir tabstop=2 shiftwidth=2 expandtab
