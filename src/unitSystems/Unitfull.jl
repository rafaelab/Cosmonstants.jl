"""
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
	
end
