defmodule Paraperceptron.Basic do

  @author 'Wesley Rodrigues <wesley.it@gmail.com>'

  import Paraperceptron  
  @moduledoc """
  The basic unity of a Paraperceptron Artificial Neural Net.
  It is like a generic unit, that can be adapted to many
  other functions like decision, analysis, maximization, etc.
  """
  
  ## The default values for high and low limits:
  @default_hl_limits [hvsc: 0.5, lvsc: -0.5, hvcc: 0.5, lvcc: -0.5]

  @doc """
  The basic unit receives two parameters, mi and lambda.
  They are numbers between 0 and 1, and represents the 
  favorable evidence and the unfavorable or contrary evidence.
  There are also some values which can be fine tuned to improve 
  the sensibility of the unit, which are the family of 
  high and low limits (hl_limits). The default is set those 
  limits to 0.5 for high and -0.5 for low, but the unit 
  can receive a List with new values.
  The limits are:
   - hvsc = higher value of sure control
   - lvsc = lower value of sure control
   - hvcc = higher value of contradiction control
   - lvcc = lower value of contradiction control
   Those constants will define the acceptable limits for answers.
  Usage:
  output(mi, lambda), where mi and lambda are numbers 
  between 0 and 1.
  It returns a tuple:
  {:tag, fel, uel}, where :tag is the name of the state. Fel and uel 
  are numbers between 0 and 1.
  When the returned tag is :help, it is listened as a signal emmited to 
  the ANN.
  """
  def output(mi, lambda, hl_limits \\ @default_hl_limits) do
    this_fel = fel(mi, lambda)
    this_uel = uel(mi, lambda)
    cond do 
      this_fel >= hl_limits[:hvsc] -> {:it_is_true, this_fel, this_uel}
      this_fel <= hl_limits[:lvsc] -> {:it_is_false, this_fel, this_uel}
      this_uel >= hl_limits[:hvcc] -> {:it_is_inconsistent, this_fel, this_uel}
      this_uel <= hl_limits[:lvcc] -> {:it_is_paracomplete, this_fel, this_uel}
      true -> {:help, this_fel, this_uel}
    end
  end

end
# vim: filetype=elixir tabstop=2 shiftwidth=2 expandtab
