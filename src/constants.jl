module Constants

using Measurements
using PhysicalConstants.CODATA2022
using Unitful

import Corpuscles: 
	Particle
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

import ..PhysicalConstantsExtended: 
	@createConstantsForMasses,
	correspondingSymbol



include("constants/hep.jl")
include("constants/astro.jl")
include("constants/extended.jl")



end