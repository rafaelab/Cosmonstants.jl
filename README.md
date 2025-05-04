# Cosmonstants.jl


[![Build Status](https://github.com/rafaelab/Cosmonstants.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/rafaelab/Cosmonstants.jl/actions)
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelab.github.io/Cosmonstants.jl/index.html)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)



This package is an extension of the package `PhysicalConstants.jl` to include more constants and things useful for my own work.
It is not meant to be complete.

It has not been thoroughly tested for `BigFloat` due to annoying errors stemming from failing assertions in PhysicalConstants.jl.



### Installation

You can install `Cosmonstants.jl` using Julia's built-in package manager.
It is compatible with Julia 1.8 and higher (I haven't tested for lower versions).

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
U = Cosmonstants.Unitfull
println(U.SolarMass) # same as above

V = Cosmonstants.Unitless
println(U.SolarMass) # prints a Float64  1.98847e30
```

This can then be used for dispatching:
```
ul = getUnitSystem(Real)
uf = getUnitSystem(Unitful.AbstractQuantity)

println(ul.SpeedOfLightInVacuum) # returns 2.99792458e8
println(uf.SpeedOfLightInVacuum) # returns the full information (from PhysicalConstants.jl)
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

