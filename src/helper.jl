# ----------------------------------------------------------------------------------------------- #
#
export 
	correspondingSymbol,
	getListOfConstants



# ----------------------------------------------------------------------------------------------- #
#
@doc """
	@captureShowOutput(ex)

A macro that captures the output of evaluating an expression `ex` and returns a tuple containing the result of the evaluation and a string representation of the output.

# Input
. `ex`: the expression to be evaluated  (e.g., a constant or a mathematical expression).

# Output
A tuple `(val, output_string)` where:\\
. `val` is the result of evaluating the expression `ex` \\
. `output_string` is a string containing the expression, its result, and its textual representation \\
"""
macro captureShowOutput(ex)
	return quote
		io = IOBuffer()
		val = $(esc(ex))
		print(io, $(string(ex)), " = ")
		show(io, MIME"text/plain"(), val)
		println(io)
		(val, String(take!(io)))
	end
end

# ----------------------------------------------------------------------------------------------- #
#
@doc """
Given a constant, return its short name.
"""
function correspondingSymbol(v)
	out = @captureShowOutput(v)[2]
	s = split(out, "\n")[1]


	pattern =  "\\([^)]*\\)"
	s = match(Regex(pattern), s)

	if isnothing(s)
		@warn "There was a problem getting the symbol corresponding to the constant $v ."
		return nothing
	end


	r = s.match
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
	listOfConstants = vcat(names(PhysicalConstantsExtended.Constants), names(PhysicalConstants.CODATA2022))

	listOfNotConstants = (:Main, :PhysicalConstantsExtended, :Constants, :CODATA2018, :CODATA2022)
	deleteat!(listOfConstants, findall(x -> x ∈ listOfNotConstants, listOfConstants))

	return listOfConstants
end

# ----------------------------------------------------------------------------------------------- #