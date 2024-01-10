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


# constants commonly used in high-energy physics
include("hep.jl")

# constants commonly used in astrophysics
include("astro.jl")

# further  constants
include("extended.jl")

end