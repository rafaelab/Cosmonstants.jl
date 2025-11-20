# ----------------------------------------------------------------------------------------------- #
#
export 
	getUnitSystem,
	getUnitSystemModule


# ----------------------------------------------------------------------------------------------- #
#
include("unitSystems/Unitfull.jl")
include("unitSystems/Unitless.jl")


# ----------------------------------------------------------------------------------------------- #
#
abstract type AbstractUnitSystem end
struct UnitlessSystem <: AbstractUnitSystem end
struct UnitfullSystem <: AbstractUnitSystem end

# provide access to modules via objects
Base.getproperty(::UnitlessSystem, s::Symbol) = getproperty(Unitless, s)
Base.getproperty(::UnitfullSystem, s::Symbol) = getproperty(Unitfull, s)


# ----------------------------------------------------------------------------------------------- #
#
@doc """
	getUnitSystem(::Type{T}) where {T}
	getUnitSystem(::T) where {T}

Returns the unit system module (`Unitfull` or `Unitless`) corresponding to the type `T`.
It acts as a dispatcher for functions that depend on the unit system.
"""
@inline getUnitSystem(::Type{T}) where {T <: Real} = UnitlessSystem()
@inline getUnitSystem(::Type{T}) where {T <:AbstractQuantity} = UnitfullSystem()
@inline getUnitSystem(::Type{T}) where {T <: Units} = UnitfullSystem()
@inline getUnitSystem(::T) where {T <: Union{Real, AbstractQuantity, Units}} = getUnitSystem(T)
@inline getUnitSystem(::AbstractArray{T, N}) where {T, N} = getUnitSystem(T)
@inline getUnitSystem(::Type{T}) where {T} = throw(ArgumentError("Unsupported type for `getUnitSystem`."))


# ----------------------------------------------------------------------------------------------- #
#
@doc """ ``
	getUnitSystemModule(::Type{<: AbstractUnitSystem})
	getUnitSystemModule(::<: AbstractUnitSystem)

Returns the unit system module (`Unitfull` or `Unitless`) corresponding to the given `AbstractUnitSystem` type or instance.
"""
@inline getUnitSystemModule(::Type{UnitlessSystem}) = Unitless
@inline getUnitSystemModule(::Type{UnitfullSystem}) = Unitfull
@inline getUnitSystemModule(::UnitlessSystem) = Unitless
@inline getUnitSystemModule(::UnitfullSystem) = Unitfull


# ----------------------------------------------------------------------------------------------- #
