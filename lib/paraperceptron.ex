defmodule Paraperceptron do
  
  @author 'Wesley Rodrigues <wesley.it@gmail.com>'
  
  @moduledoc """
  Provide an easy way to deal with Paraconsistent Logic applied
  to Artificial Neural Networks (ANNs).

  There are multiple mathematic equations and functions used
  during the ANN construction. They are available in the main
  module (this file).
  
  To build the ANN there are many models which can be used, depending 
  on the problem domain. Each ANN unit imports functions from this
  module.
  """

  @doc """
  *fel* = Favorable evidence level, which calculates the relation
  between the positive and negative evidences. 
  
  ### Usage:
  
   - `fel(mi, lambda)`, where mi and lambda are numbers between 0 and 1.
  It returns the favorable evidence level, which is a number between -1 and 1.
  """
  @spec fel(number, number) :: number
  def fel(mi, lambda), do: mi - lambda

  @doc """
  uel = Unfavorable evidence level, which calculates the relation
  between the positive and negative contradictions. 

  ### Usage:

   - `uel(mi, lambda)`, where mi and lambda are numbers between 0 and 1.

  It returns the unfavorable evidence level, which is a number between -1 and 1.
  """
  @spec uel(number, number) :: number
  def uel(mi, lambda), do: (mi + lambda) - 1

  @doc """
  Resulting trust level is the basic structural equation used 
  to get the final value for decision in analytic and other advanced units.

  ### Usage:

   - `rtl(mi, lambda, lf)`, where lf, mi and lambda are numbers between 0 and 1.
   - `rtl(mi, lambda)`, where mi and lambda are numbers between 0 and 1.

   It returns the resulting trust level, which is a number between 0 and 1.
  """
  @spec rtl(number, number, number) :: number
  def rtl(mi, lambda, lf), do: (lf * (mi - lambda) + 1) / 2 
  @spec rtl(number, number, number) :: number
  def rtl(mi, lambda), do: (mi - lambda + 1) / 2 

  @doc """
  The very latest decisions of an unity are supported by special values 
  named truth_limit_value and falsity_limit_value.
  
  ### Usage:

   - `limit_values(dtf)`, where dtf (Decision Tolerance Factor) is a number 
  between 0 and 1.
 
  It returns a number between 0 and 0.5, which can be used as 
  tlv (truth_limit_value and flv (falsity_limit_value).
  """
  @spec limit_values(number) :: number
  def limit_values(dtf), do: (1 - dtf) / 2

end
# vim: filetype=elixir tabstop=2 shiftwidth=2 expandtab
