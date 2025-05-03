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



# helper functions
include("helper.jl")

# generate constants from package `Corpuscles.jl`
include("corpuscles.jl")

# references to the sources from where the data was extracted
include("references.jl")

# sub-module containing the constants
include("constants.jl")


# reexport CODATA2022 from PhysicalConstants.jl
#   import list of constants of `PhysicalConstants.jl` and reexport
listOfConstantsCODATA = names(PhysicalConstants.CODATA2018)
deleteat!(listOfConstantsCODATA, findall(x -> x == :CODATA2022, listOfConstantsCODATA))
for constant in listOfConstantsCODATA
	v = String(correspondingSymbol(constant))
	@eval import PhysicalConstants.CODATA2022.($(Symbol(v)))
end


# reexport Constants sub-module for convenience
@reexport using .Constants
for constant in getListOfConstants()
	v = String(correspondingSymbol(constant))
	@eval import PhysicalConstantsExtended.Constants.($(Symbol(v)))
	@eval export $(constant)
end


end # module 
