module Cosmonstants

using Corpuscles
using PhysicalConstants
using PhysicalConstants.CODATA2022
using Reexport
@reexport using Measurements
@reexport using Unitful


import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants: PhysicalConstant
import Unitful: AbstractQuantity



include("helper.jl")
include("corpuscles.jl")
include("references.jl")
include("constants.jl")
include("toggler.jl")



# reexport Constants sub-module for convenience
@reexport using .Constants
for constant ∈ getListOfConstants()
	@eval v = correspondingSymbol($constant)
	@eval const $v = $constant
	# @eval export $constant
end


end # module 
