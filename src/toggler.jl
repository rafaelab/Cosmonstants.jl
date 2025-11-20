# ----------------------------------------------------------------------------------------------- #
#
export 
	getUnitSystem


# ----------------------------------------------------------------------------------------------- #
#
include("unitSystems/Unitless.jl")
include("unitSystems/Unitfull.jl")


# ----------------------------------------------------------------------------------------------- #
#
abstract type AbstractUnitSystem end
struct UnitlessSystem <: AbstractUnitSystem end
struct UnitfullSystem <: AbstractUnitSystem end


# ----------------------------------------------------------------------------------------------- #
#
@doc """
	getUnitSystem(::Type{T}) where {T}
	getUnitSystem(::T) where {T}

Returns the unit system module (`Unitfull` or `Unitless`) corresponding to the type `T`.
It acts as a dispatcher for functions that depend on the unit system.
"""
@inline getUnitSystem(::Type{<: Real}) = Unitless
@inline getUnitSystem(::Type{<: Unitful.Quantity}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.AbstractQuantity}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.FreeUnits}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.Units}) = Unitfull
@inline getUnitSystem(::Type{T}) where {T} = throw(ArgumentError("Unsupported type for `getUnitSystem`."))

@inline getUnitSystem(::Type{UnitlessSystem}) = Unitless
@inline getUnitSystem(::Type{UnitfullSystem}) = Unitfull
@inline getUnitSystem(::UnitlessSystem) = Unitless
@inline getUnitSystem(::UnitfullSystem) = Unitfull


# ----------------------------------------------------------------------------------------------- #
