# Paraperceptron

[![Build Status](https://travis-ci.org/wesleyit/paraperceptron.svg)](https://travis-ci.org/wesleyit/paraperceptron)

A paraconsistent logic is a logical system that attempts to deal with contradictions in a discriminating way. 
Alternatively, paraconsistent logic is the subfield of logic that is concerned with studying and developing paraconsistent (or "inconsistency-tolerant") systems of logic.

In classical logic (as well as intuitionistic logic and most other logics), contradictions entail everything.

Paraconsistent logics are propositionally weaker than classical logic; that is, they deem fewer propositional inferences valid. The point is that a paraconsistent logic can never be a propositional extension of classical logic, that is, propositionally validate everything that classical logic does. In some sense, then, paraconsistent logic is more conservative or cautious than classical logic.

[Read more in Wikipedia.](https://en.wikipedia.org/wiki/Paraconsistent_logic)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add paraperceptron to your list of dependencies in `mix.exs`:

        def deps do
          [{:paraperceptron, "~> 0.0.1"}]
        end

  2. Ensure paraperceptron is started before your application:

        def application do
          [applications: [:paraperceptron]]
        end
