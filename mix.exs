defmodule NeotomaCompiler.MixProject do
  use Mix.Project

  def project do
    [
      app: :neotoma_compiler,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :dev,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:neotoma, "~> 1.7"},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:ex_check, "~> 0.16", only: [:dev, :test]},
      {:igniter, "~> 0.5", only: [:dev, :test]}
    ]
  end
end
