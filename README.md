# PhysicalConstantsExtended.jl


[![Build Status](https://github.com/rafaelab/PhysicalConstantsExtended.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/rafaelab/PhysicalConstantsExtended.jl/actions)
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelab.github.io/PhysicalConstantsExtended.jl/index.html)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)



This package is an extension of the package `PhysicalConstants.jl` to include more constants and things useful for my own work.
It is not meant to be complete.

It has not been thoroughly tested for `BigFloat` due to annoying errors stemming from failing assertions in PhysicalConstants.jl.

Unlike `PhysicalConstants.jl`, I disregard the distinction between `@constant` and `@derived_constant`, since this is completely arbitrarily (all constants could, in principle, be derived from a subset of them, although a few of them are manifestly derived).

Documentation will be added soon.


### Installation

You can install `PhysicalConstantsExtended.jl` using Julia's built-in package manager.
It is compatible with Julia 1.4 and higher (although it might work down to Julia 1.0).

### Example

As an example, the user can print the constant `SolarMass`:
```
mass of the Sun (M☉)
Value                         = 1.98847e30 kg
Standard uncertainty          = 7.0e25 kg
Relative standard uncertainty = 3.5e-5
Reference                     = IAU1976
```
Note that this is exactly the same format as in `PhysicalConstants.jl`.

A very nice functionality is the implementation of two modules reexporting all constants.
`Unitfull` and `Unitless` are such modules. The former is redundant with respect to `PhysicalConstants.jl`.
However, with these two modules it is now possible to more easily dispatch on optional unit systems.
```
U = PhysicalConstantsExtended.Unitfull
println(U.SolarMass) # same as above

V = PhysicalConstantsExtended.Unitless
println(U.SolarMass) # prints a Float64  1.98847e30
```


### References

The data used come from various sources.
You can get the full reference and link to the original sources by doing:
```
fullReference(shortRef)
```

### Main features

Arguably, the main feature of this package is its interface with `Corpuscles.jl`.
This allows users to treat particle masses as constants from `PhysicalConstants.jl`.
In the future, I might extended it to define other quantities listed in the former but not in the latter package.


### Disclaimer

This package is public but it is for my personal use.
It is licensed under the MIT license. 
I do not guarantee that everything is accurate. 
While bug reports are more than welcome, no support will be provided.

