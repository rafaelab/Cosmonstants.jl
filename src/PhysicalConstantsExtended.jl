module PhysicalConstantsExtended

using Corpuscles
using Reexport
@reexport using Measurements
@reexport using PhysicalConstants.CODATA2018
@reexport using Unitful

import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants.CODATA2018: c_0, ħ, h, k_B


# generate constants from package `Corpuscles.jl`
include("corpuscles.jl")

# constants commonly used in high-energy physics
include("hep.jl")

# constants commonly used in astrophysics
include("astro.jl")

# references to the sources from where the data was extracted
include("references.jl")



end # module 
