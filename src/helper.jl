# ----------------------------------------------------------------------------------------------- #
#
export correspondingSymbol

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