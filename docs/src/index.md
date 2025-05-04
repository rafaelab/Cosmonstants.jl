# Cosmonstants.jl


This package is an extension of the package `PhysicalConstants.jl` to include more constants and things useful for my own work.
It is not meant to be complete.

It has not been thoroughly tested for `BigFloat` due to annoying errors stemming from failing assertions in PhysicalConstants.jl.

Arguably, one of the main functionalities is the possibility to decide between `Unitfull` and `Unitless` constants.
The former behaves exactly like PhysicalConstants.jl, whereas the latter provides only the numerical values of the constants in S.I. units (as `Float64`). 
This is very useful for dispatching.



```@meta
DocTestSetup = quote
    using Cosmonstants
end
```

```@autodocs
Modules = [Cosmonstants, Cosmonstants.Unitfull, Cosmonstants.Unitless]
```


