# Unit Toggler

Cosmonstants.jl ships two parallel views of the same constants:

- `Cosmonstants.Unitfull` keeps the `Unitful.jl` units attached.
- `Cosmonstants.Unitless` strips those units and keeps the numerical SI values.

The toggler API is the small layer that lets you move between those two views without writing manual `if x isa Quantity` branches in every function.

```@meta
DocTestSetup = quote
	using Cosmonstants
end
```

## The basic idea

`getUnitSystem` inspects either a type or a value and returns a lightweight marker object:
- `UnitlessSystem()` for plain real numbers.
- `UnitfullSystem()` for `Unitful` quantities or units.

```julia-repl
julia> getUnitSystem(Float64)
UnitlessSystem()

julia> getUnitSystem(Unitful.Quantity)
UnitfullSystem()

julia> getUnitSystem(1.0)
UnitlessSystem()

julia> getUnitSystem(1.0u"m")
UnitfullSystem()
```
This is the central trick: the caller does not need to decide ahead of time whether a computation should use unit-carrying constants or bare numbers. 
The input type decides it.


## Why return an object?

The returned object behaves like a gateway to the corresponding namespace.
In `src/toggler.jl`, `Base.getproperty` is overloaded so that `system.c_0`, `system.ħ`, or `system.M☉` are forwarded to either `Cosmonstants.Unitless` or `Cosmonstants.Unitfull`.

```julia-repl
julia> ul = getUnitSystem(1.0)
UnitlessSystem()

julia> ul.c_0
2.99792458e8

julia> uf = getUnitSystem(1.0u"m")
UnitfullSystem()

julia> uf.c_0
SpeedOfLightInVacuum (c_0)
Value                         = 2.99792458e8 m s^-1
Standard uncertainty          = 0.0 m s^-1
Reference                     = CODATA2022
```
So `ul.c_0` and `uf.c_0` are the same physical constant, but seen through different unit systems.


## A generic function pattern

This becomes useful when you want one method to work for both raw numbers and `Unitful` quantities.
```julia
using Cosmonstants
using Unitful

rest_energy(mass) = begin
	system = getUnitSystem(mass)
	mass * system.c^2
end
```
Now the same function adapts automatically:
```julia-repl
julia> rest_energy(1.0)
8.987551787368176e16

julia> rest_energy(1.0u"kg")
8.987551787368176e16 kg m^2 s^-2
```
The function body never mentions `Unitfull` or `Unitless` directly. 
It only asks for the appropriate system and then uses the same constant name in both cases.


## Types, values, and arrays

The toggler accepts more than one shape of input:
- A type such as `Float64` or `Unitful.Quantity`.
- A value such as `2.0` or `3.0u"s"`.
- An array, in which case the element type is inspected.
```julia-repl
julia> getUnitSystem([1.0, 2.0, 3.0])
UnitlessSystem()

julia> getUnitSystem([1.0u"m", 2.0u"m"])
UnitfullSystem()
```
This makes it convenient for vectorized or tabular workflows where the unit convention is carried by the array element type.


## `getUnitSystem` versus `getUnitSystemModule`

Most user code should start with `getUnitSystem`, because the returned object supports property access directly.
If you explicitly need the underlying module, use `getUnitSystemModule`:
```julia-repl
julia> system = getUnitSystem(1.0u"K")
UnitfullSystem()

julia> getUnitSystemModule(system)
Cosmonstants.Unitfull
```
That is mainly useful when you want to pass the module itself to another helper or inspect it programmatically.


## What happens for unsupported inputs?

If the type is neither a plain real number nor a `Unitful` quantity/unit, the toggler throws an `ArgumentError`.
That failure mode is intentional: it prevents silent selection of the wrong constant table.
In practice, the toggler is a small dispatch bridge:
1. Determine whether the input is unitless or unit-carrying.
2. Return the matching system object.
3. Forward property lookups to the corresponding constant namespace.
That keeps numerical code short while still making the unit choice explicit and type-driven.