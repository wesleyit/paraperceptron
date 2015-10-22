defmodule Paraperceptron do
  @moduledoc """
  Provide an easy way to deal with Paraconsistent Logic RNAs.
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
    cond do 
      fel(mi, lambda) >= limits[:hvsc] -> :it_is_true
      fel(mi, lambda) <= limits[:lvsc] -> :it_is_false
      uel(mi, lambda) >= limits[:hvcc] -> :it_is_inconsistent
      uel(mi, lambda) >= limits[:lvcc] -> :it_is_paracomplete
      true -> :help
    end
  end

end

# vim: filetype=elixir tabstop=2 shiftwidth=4 expandtab
