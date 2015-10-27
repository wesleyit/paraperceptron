defmodule Paraperceptron.Learning do
  import Paraperceptron  

  @author 'Wesley Rodrigues <wesley.it@gmail.com>'

  @moduledoc """
  The learning unity of a Paraperceptron Artificial Neural Net.
  This is an inportant piece of Paraperceptron ANNs, it learns 
  patterns to get adjusted values.
  """
  
  ## The default value for mi2 and lf (learning factor):
  @default_mi2 0.5
  @lf 1

  @doc """
  This is a recursive function that runs until the output
  value become equals the desired value.
  """
  @spec output(number, number, number, integer) :: number
  def output(mi1, mi2 \\ @default_mi2, desired, step \\ 1) do
    mi = mi1
    lambda = 1 - mi2
    mir = rtl(mi, lambda, @lf)
    IO.puts("Step: #{step}, Mi: #{mi}, Lambda: #{lambda}, Mir: #{mir}, Desired: #{desired}")
    if mir != desired, do: output(mi, mir, desired, step + 1)
  end

end
# vim: filetype=elixir tabstop=2 shiftwidth=2 expandtab
