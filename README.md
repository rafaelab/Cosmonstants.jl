# PhysicalConstantsExtended.jl

This package is an extension of the package `PhysicalConstants.jl` to include more constants and things useful for my own work.
It is not meant to be complete.

It has not been thoroughly tested for `BigFloat` due to annoying errors stemming from failing assertions in PhysicalConstants.jl.

Unlike `PhysicalConstants.jl`, I disregard the distinction between `@constant` and `@derived_constant`, since this is completely arbitrarily (all constants could, in principle, be derived from a subset of them, although a few of them are manifestly derived).


### References

The data used come from various sources.
You can get the full reference and link to the original sources by doing:
```
fullReference(constant)
```

### Main features

Arguably, the main feature of this package is its interface with `Corpuscles.jl`.
This allows users to treat particle masses as constants from `PhysicalConstants.jl`.
In the future, I might extended it to define other quantities listed in the former but not in the latter package.


### Disclaimer

This package is public but it is for my personal use. 
I do not guarantee that everything is accurate. 
While bug reports are more than welcome, no support will be provided.

