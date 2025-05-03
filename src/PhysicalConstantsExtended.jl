module PhysicalConstantsExtended

using Corpuscles
using Reexport
@reexport using Measurements
@reexport using PhysicalConstants
@reexport using Unitful
@reexport using PhysicalConstants.CODATA2022

import PhysicalConstants: @constant, @derived_constant
import PhysicalConstants: PhysicalConstant
import Unitful: AbstractQuantity



include("helper.jl")
include("corpuscles.jl")
include("references.jl")
include("constants.jl")
include("toggler.jl")


# reexport CODATA2022 from PhysicalConstants.jl
#   import list of constants of `PhysicalConstants.jl` and reexport
listOfConstantsCODATA = names(PhysicalConstants.CODATA2022)
deleteat!(listOfConstantsCODATA, findall(x -> x == :CODATA2022, listOfConstantsCODATA))
for constant ∈ listOfConstantsCODATA
	@eval import PhysicalConstants.CODATA2022.$(constant)
end

# reexport Constants sub-module for convenience
@reexport using .Constants
for constant ∈ getListOfConstants()
	@eval v = correspondingSymbol($constant)
	@eval const $v = $constant
	@eval export $constant
end


end # module 
