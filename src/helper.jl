# ----------------------------------------------------------------------------------------------- #
#
export 
	correspondingSymbol,
	getListOfConstants

# ----------------------------------------------------------------------------------------------- #
#
@doc """
Given a constant, return its short name.
"""
function correspondingSymbol(v)
	buffer = IOBuffer()
	@eval print($buffer, $v)
	s = String(take!(buffer))

	pattern =  "\\([^)]*\\)"
	r = match(Regex(pattern), s).match
	r = replace(r, "(" => "")
	r = replace(r, ")" => "")

	if isnothing(r)
		@warn "There was a problem getting the symbol corresponding to the constant."
	end

	return Symbol(r)
end


# ----------------------------------------------------------------------------------------------- #
#
@doc """
Get list of constants.
This is useful to remove items that are not constants to create table of constants.
"""
function getListOfConstants()
	listOfConstants = names(PhysicalConstantsExtended.Constants)

	listOfNotConstants = (:Main, :PhysicalConstantsExtended, :Constants, :CODATA2018)
	deleteat!(listOfConstants, findall(x -> x ∈ listOfNotConstants, listOfConstants))

	return listOfConstants
end

# ----------------------------------------------------------------------------------------------- #