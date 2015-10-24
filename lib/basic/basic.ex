defmodule Paraperceptron.Basic do
  @moduledoc """
  The basic unity of a Paraperceptron Artificial Neural Net.
  This is the start point for all the others units.
  Wesley Rodrigues <wesley.it@gmail.com>
  """

  @doc """
  Favorable evidence level(favorable input, unfavorable input) 
  """
  def fel(mi, lambda), do: mi - lambda

  @doc """
  Unfavorable evidence level(favorable input, unfavorable input) 
  """
  def uel(mi, lambda), do: (mi + lambda) - 1

  @doc """
  Get the calculated output({favorable input, unfavorable input}, [limits])
  The limits are:
   - hvsc = higher value of sure control
   - lvsc = lower value of sure control
   - hvcc = higher value of contradiction control
   - lvcc = lower value of contradiction control
   Those constants will define the acceptable limits for answers.
  """
  def output(mi, lambda, limits \\ [hvsc: 0.5, lvsc: -0.5, hvcc: 0.5, lvcc: -0.5]) do
    this_fel = fel(mi, lambda)
    this_uel = uel(mi, lambda)
    cond do 
      this_fel >= limits[:hvsc] -> {:it_is_true, this_fel, this_uel}
      this_fel <= limits[:lvsc] -> {:it_is_false, this_fel, this_uel}
      this_uel >= limits[:hvcc] -> {:it_is_inconsistent, this_fel, this_uel}
      this_uel <= limits[:lvcc] -> {:it_is_paracomplete, this_fel, this_uel}
      true -> {:help, this_fel, this_uel}
    end
  end

end

# vim: filetype=elixir tabstop=2 shiftwidth=4 expandtab
