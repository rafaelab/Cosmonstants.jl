# Cosmonstants.jl

Cosmonstants.jl builds on top of PhysicalConstants.jl to deliver extra constants (astrophysics, high-energy physics, and Corpuscles-derived particle masses) together with simple utilities for working with multiple unit systems.

```@meta
DocTestSetup = quote
	using Cosmonstants
end
```

## Highlights

- `Cosmonstants.Constants` exports CODATA2022 data as well as the extended sets defined in `constants/extended.jl`, `constants/hep.jl`, and `constants/astro.jl` so everything stays in sync with the registrar helpers used by the package.
- The `@createConstantsForMasses` macro turns Corpuscles.jl particle masses into the same `@constant` entries used by PhysicalConstants; this is why `MassMuon`, `MassTau`, and the quark masses live in the same table as `SolarMass` and `PlanckConstant`.
- `Cosmonstants.Unitfull` re-exports those constants under short aliases such as `c_0`, `ħ`, or `M☉`, while `Cosmonstants.Unitless` strips the units so you can work with raw SI numbers.
- `getUnitSystem` + `getUnitSystemModule` dispatch on `Real` versus `AbstractQuantity` so multi-method APIs can react to the caller's preferred system without manual branching.

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

julia> uf.c_0
SpeedOfLightInVacuum (c_0)
Value                         = 2.99792458e8 m s^-1
Standard uncertainty          = 0.0 m s^-1
Reference                     = CODATA2022

julia> ul = getUnitSystem(Float64)
UnitlessSystem()

julia> ul.c_0
2.99792458e8
```

## Helpers & references

- `getListOfConstants()` lists the canonical constants that feed the modules above; use it to build tables, documentation, or introspection tools.
- `correspondingSymbol(constant)` returns the short alias for `Unitfull` (useful for generating tables or matching to external datasets).
- `fullReference(shortRef)` looks up the stored bibliography entries plus sensible fallbacks (CODATA2022, PDG2022, IAU resolutions, etc.).

Whenever you add new constants, keep `constants/extended.jl`, `constants/hep.jl`, or `constants/astro.jl` in sync with the relevant references and `correspondingSymbol` aliases.

## Building the docs

This repository ships with a Documenter.jl build under `docs/`. To rebuild locally, run:

```bash
julia --project=docs docs/make.jl
```

The generated output lands in `docs/build` and mirrors what is hosted at <https://rafaelab.github.io/Cosmonstants.jl/index.html>.

```@autodocs
Modules = [Cosmonstants, Cosmonstants.Unitfull, Cosmonstants.Unitless]
```
