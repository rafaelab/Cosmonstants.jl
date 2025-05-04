module Constants

using Measurements
using PhysicalConstants
using PhysicalConstants.CODATA2022
using Unitful

import Corpuscles: 
	Particle
	
import Measurements:
	value,
	uncertainty

import PhysicalConstants: 
	PhysicalConstant,
	@derived_constant,
	@constant

import PhysicalConstants.CODATA2022: 
	c_0, 
	ħ, 
	h, 
	k_B

import Unitful: 
	AbstractQuantity

import ..@createConstantsForMasses
import ..correspondingSymbol




# reexport CODATA2022 from PhysicalConstants.jl
#   import list of constants of `PhysicalConstants.jl` and reexport
listOfConstantsCODATA = names(PhysicalConstants.CODATA2022)
deleteat!(listOfConstantsCODATA, findall(x -> x == :CODATA2022, listOfConstantsCODATA))
for constant ∈ listOfConstantsCODATA
	@eval begin
		import PhysicalConstants.CODATA2022.$(constant)
		export $constant
	end
end




include("constants/extended.jl")
include("constants/hep.jl")
include("constants/astro.jl")




end