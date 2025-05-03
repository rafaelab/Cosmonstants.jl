# ----------------------------------------------------------------------------------------------- #
#
export 
	getUnitSystem


# ----------------------------------------------------------------------------------------------- #
#
@doc """
	module Unitfull

This module defines a set of physical constants and derived quantities. 
It imports fundamental constants from external modules and provides shorthand notations for convenience.
By using the module, the corresponding constants/units are scope-protected.
"""
module Unitfull
	import ..getListOfConstants
	import ..correspondingSymbol

	for constant ∈ getListOfConstants()
		@eval import ..Constants.$constant
		@eval v = correspondingSymbol($constant)
		@eval const $v = $constant
		@eval export $constant
	end
end

# ----------------------------------------------------------------------------------------------- #
#
@doc """
	module Unitless

This module defines a set of physical constants and derived quantities stripping its units.
The default is S.I. units.
"""
module Unitless
	using Unitful
	import ..getListOfConstants
	import ..correspondingSymbol
	import ..Unitfull

	for name ∈ names(Unitfull, all = true)
		if isconst(Unitfull, name)
			val = getfield(Unitfull, name)
			if val isa Number
				@eval const $(name) = Unitful.ustrip(Unitfull.$(name))
			end
		end
	end
end


# ----------------------------------------------------------------------------------------------- #
#
@inline getUnitSystem(::Type{<: Real}) = Unitless
@inline getUnitSystem(::Type{<: Unitful.Quantity}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.AbstractQuantity}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.FreeUnits}) = Unitfull
@inline getUnitSystem(::Type{<: Unitful.Units}) = Unitfull
@inline getUnitSystem(::Type{T}) where {T} = throw(ArgumentError("Unsupported type for `getUnitSystem`."))


# ----------------------------------------------------------------------------------------------- #
