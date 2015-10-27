defmodule Paraperceptron.Mixfile do
  use Mix.Project

  def project do
    [app: :paraperceptron,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
	[
      {:earmark, "~> 0.1", only: :docs},
      {:ex_doc, "~> 0.10", only: :docs}
	]
  end

  defp description do
		"""
		Paraconsistent logic units for Elixir
		"""
  end
end

