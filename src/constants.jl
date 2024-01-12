module Constants

import Corpuscles: Particle
import Reexport: @reexport
import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants: PhysicalConstant
import PhysicalConstants.CODATA2018: c_0, ħ, h, k_B
import Unitful: AbstractQuantity, @u_str, ustrip

using PhysicalConstants

for constant in names(PhysicalConstants.CODATA2018)
	@eval @reexport import PhysicalConstants.CODATA2018: $constant
end

import PhysicalConstantsExtended: @createConstantsForMasses
import PhysicalConstantsExtended: correspondingSymbol


# import list of constants of `PhysicalConstants.jl` and reexport
listOfConstantsBase = names(PhysicalConstants.CODATA2018)
deleteat!(listOfConstantsBase, findall(x -> x == :CODATA2018, listOfConstantsBase))

# bring all symbols corresponding to constants to the `Constants` scope
# this ensures that these symbols can be easily imported directly from `PhysicalConstantsExtended` afterwards
for constant in listOfConstantsBase
	v = String(correspondingSymbol(constant))
	@eval import PhysicalConstants.CODATA2018.($(Symbol(v)))
end


# constants commonly used in high-energy physics
include("hep.jl")

# constants commonly used in astrophysics
include("astro.jl")

# further  constants
include("extended.jl")

end