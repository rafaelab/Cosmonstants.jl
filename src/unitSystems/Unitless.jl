"""
	module Unitless

This module defines a set of physical constants and derived quantities stripping its units.
The default is S.I. units.
"""
module Unitless

	using Unitful
	import ..getListOfConstants
	import ..correspondingSymbol
	import ..Unitfull

	for name ∈ names(Unitfull, all = true)
		if isconst(Unitfull, name)
			val = getfield(Unitfull, name)
			if val isa Number
				@eval const $(name) = Unitful.ustrip(Unitfull.$(name))
			end
		end
	end

end