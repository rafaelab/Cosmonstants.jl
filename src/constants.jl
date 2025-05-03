module Constants

using Measurements
using PhysicalConstants.CODATA2022

import Corpuscles: Particle
import Reexport: @reexport
import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants: PhysicalConstant
import PhysicalConstants.CODATA2022: c_0, ħ, h, k_B
import Unitful: AbstractQuantity, @u_str, ustrip

import PhysicalConstantsExtended: @createConstantsForMasses
import PhysicalConstantsExtended: correspondingSymbol


# constants commonly used in high-energy physics
include("hep.jl")

# constants commonly used in astrophysics
include("astro.jl")

# further  constants
include("extended.jl")




end