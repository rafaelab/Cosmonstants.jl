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
	end

	# since things are module-protected, define more aliases
	const σₑ = σ_e 
	const μ₀ = μ_0
	const ε₀ = ε_0
	const c = c_0
	const c² = c * c
	const c³ = c * c²
	const c⁴ = c * c³
	const mₚ = m_p
	const mₙ = m_n
	const mₑ = m_e
	const mₑc² = mₑ * c²
	const mₑ²c⁴ = mₑc² * mₑc²
	const mₑc²ˆ² = mₑ²c⁴
	const mₑc²ˆ³ = mₑc² * mₑc²ˆ²
	const mₑc²ˆ⁴ = mₑc² * mₑc²ˆ³
	const mₑc²ˆ⁵ = mₑc² * mₑc²ˆ⁴
	const mₑc²ˆ⁶ = mₑc² * mₑc²ˆ⁵
	const ħ²c² = ħc * ħc
	const ħ³c³ = ħ²c² * ħc
	const ħ⁴c⁴ = ħ²c² * ħ²c²
	const ħcˆ² = ħ²c²
	const ħcˆ³ = ħ³c³
	const ħcˆ⁴ = ħ⁴c⁴
	const hc = h * c
	const h²c² = hc * h²c²
	const hcˆ² = h²c²
	
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
