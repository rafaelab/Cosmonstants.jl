module PhysicalConstantsExtended

using Corpuscles
using Reexport
@reexport using Measurements
@reexport using PhysicalConstants.CODATA2018
@reexport using Unitful

import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants: PhysicalConstant
import PhysicalConstants.CODATA2018: c_0, ħ, h, k_B
import Unitful: AbstractQuantity


# generate constants from package `Corpuscles.jl`
include("corpuscles.jl")

# references to the sources from where the data was extracted
include("references.jl")

# sub-module containing the constants
include("constants.jl")

@reexport using .Constants

end # module 
