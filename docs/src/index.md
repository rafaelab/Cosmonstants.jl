# PhysicalConstantsExtended.jl


This package is an extension of the package `PhysicalConstants.jl` to include more constants and things useful for my own work.
It is not meant to be complete.

It has not been thoroughly tested for `BigFloat` due to annoying errors stemming from failing assertions in PhysicalConstants.jl.

Unlike `PhysicalConstants.jl`, I disregard the distinction between `@constant` and `@derived_constant`, since this is completely arbitrarily (all constants could, in principle, be derived from a subset of them, although a few of them are manifestly derived).



```@meta
DocTestSetup = quote
    using PhysicalConstantsExtended
end
```

```@autodocs
Modules = [PhysicalConstants]
```


