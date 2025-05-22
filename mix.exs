defmodule NeotomaCompiler.MixProject do
  use Mix.Project

  @moduledoc "A mix compiler task for neotoma PEG files"

  @version "0.1.2"
  def project do
    [
      app: :neotoma_compiler,
      consolidate_protocols: Mix.env() != :dev,
      description: @moduledoc,
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"]
      ],
      elixir: "~> 1.14",
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      name: :neotoma_compiler,
      files: ~w[lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*],
      maintainers: ["James Harton <james@harton.nz>"],
      licenses: [],
      links: %{
        "Source" => "https://harton.dev/james/neotoma_compiler",
        "GitHub" => "https://github.com/jimsynz/neotoma_compiler",
        "Sponsor" => "https://github.com/sponsors/jimsynz"
      },
      source_url: "https://harton.dev/james/neotoma_compiler"
    ]
  end

  defp deps do
    [
      {:neotoma, "~> 1.7"},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:ex_check, "~> 0.16", only: [:dev, :test]},
      {:ex_doc, "~> 0.38", only: [:dev, :test], runtime: false},
      {:git_ops, "~> 2.0", only: [:dev, :test], runtime: false},
      {:igniter, "~> 0.6", only: [:dev, :test]}
    ]
  end
end
