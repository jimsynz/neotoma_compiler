# Neotoma Compiler

[![Build Status](https://drone.harton.dev/api/badges/james/neotoma_compiler/status.svg)](https://drone.harton.dev/james/neotoma_compiler)
[![Hex.pm](https://img.shields.io/hexpm/v/neotoma_compiler.svg)](https://hex.pm/packages/neotoma_compiler)
[![Hippocratic License HL3-FULL](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-FULL&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/full.html)

A mix compiler which adds support for compiling
[Neotoma](https://hex.pm/packages/neotoma) `.peg` files into Erlang source.

## Installation

Add to your dependencies by adding it to the deps in you `mix.exs`. You only
need to add it to your `:dev` and maybe `:test` environments to compile your
parsers for export as part of your mix package.

```elixir
def deps do
  [
    # ...
    {:neotoma_compiler, "~> 0.1.3", only: [:dev, :test], runtime: false},
    # ...
  ]
end
```

Additionally you must add it to your project's compilers:

```elixir
def project do
  [
    # ...
    compilers: compilers(Mix.env())
    # ...
  ]
end

defp compilers(env) when env in [:dev, :test], do: [:neotoma | Mix.compilers()]
defp compilers(_env), do: Mix.compilers()
```

Now any file ending in `.peg` will be compiled into a corresponding `.erl` file
in the same directory.

## Github Mirror

This repository is mirrored [on Github](https://github.com/jimsynz/neotoma_compiler)
from it's primary location [on my Forgejo instance](https://harton.dev/james/neotoma_compiler).
Feel free to raise issues and open PRs on Github.

## License

This software is licensed under the terms of the
[HL3-FULL](https://firstdonoharm.dev), see the `LICENSE.md` file included with
this package for the terms.

This license actively proscribes this software being used by and for some
industries, countries and activities. If your usage of this software doesn't
comply with the terms of this license, then [contact me](mailto:james@harton.nz)
with the details of your use-case to organise the purchase of a license - the
cost of which may include a donation to a suitable charity or NGO.
