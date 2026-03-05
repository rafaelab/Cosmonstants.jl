# Cosmonstants.jl

[![Build Status](https://github.com/rafaelab/Cosmonstants.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/rafaelab/Cosmonstants.jl/actions)
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelab.github.io/Cosmonstants.jl/index.html)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

Cosmonstants.jl extends PhysicalConstants.jl with additional constants and helpers that keep a tight interface with Corpuscles.jl while making it easy to switch between unitful and unitless representations.

## Highlights

- Re-export CODATA2022, astrophysics, and high-energy-physics constants through `Cosmonstants.Constants`, including a growing list of masses derived from Corpuscles.jl particle data.
- Provide two helper modules, `Cosmonstants.Unitfull` and `Cosmonstants.Unitless`, and a dispatcher (`getUnitSystem`) so that you can easily write methods that accept either detailed measurements or plain numbers.
- Offer lightweight helpers such as `getListOfConstants`, `correspondingSymbol`, and `fullReference` so you can build tables, resolvers, or formatted documentation without reinventing the wheel.

## Installation

Install from the standard registry with Julia 1.9 or newer:

```julia
julia> import Pkg
julia> Pkg.add("Cosmonstants")
```

## Quick start

```julia
julia> using Cosmonstants

julia> Cosmonstants.SolarMass
mass of the Sun (M☉)
Value                         = 1.98847e30 kg
Standard uncertainty          = 7.0e25 kg
Relative standard uncertainty = 3.5e-5
Reference                     = IAU1976
```

```julia
julia> uf = getUnitSystem(Unitful.Quantity)
UnitfullSystem()

julia> uf.SpeedOfLightInVacuum
SpeedOfLightInVacuum (c_0)
Value                         = 2.99792458e8 m s^-1
Standard uncertainty          = 0.0 m s^-1
Reference                     = CODATA2022

julia> ul = getUnitSystem(Float64)
UnitlessSystem()

julia> ul.SpeedOfLightInVacuum
2.99792458e8
```

The `Unitfull` module mirrors the measurements from `PhysicalConstants.jl`, while `Unitless` strips the units and exposes plain numbers for fast arithmetic or dispatch.

## Helper utilities

- `getListOfConstants()` returns the canonical set of exported constants; it drives the modules above and powers the auto-generated tables in the documentation.
- `correspondingSymbol(constant)` gives you the short alias that `Unitfull` uses (e.g., `:c_0` for `SpeedOfLightInVacuum`).
- `fullReference(shortRef)` resolves the stored references by key (e.g., `"CODATA2022"` or the shorthand from `@constant`).

## Testing & documentation

Run the unit suite with the project environment:

```bash
julia --project=. test/runtests.jl
```

The pre-built `docs/` directory contains Documenter.jl-powered HTML documentation. To rebuild it locally:

```bash
cd docs
julia --project=docs docs/make.jl
```

Visit https://rafaelab.github.io/Cosmonstants.jl/index.html for the hosted version.

## Disclaimer

This project is maintained for my personal use, so correctness is not guaranteed. Bug reports are appreciated, but support is offered on a best-effort basis. The package is licensed under MIT; see `LICENSE` for details.
