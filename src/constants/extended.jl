export 
	DiracConstant


# ----------------------------------------------------------------------------------------------- #
# 

# Create aliases for some variables
const DiracConstant = ReducedPlanckConstant


# ----------------------------------------------------------------------------------------------- #
# 
@derived_constant(DiracConstantTimesSpeedOfLight,
	ħc, 
	"Dirac constant times speed of light",
	convert(Float64, ustrip(big(ħ) * big(c_0))),
	ustrip(big(ħ) * big(c_0)), 
	u"J * m",
	measurement(ħ) * measurement(c_0),
	measurement(BigFloat, ħ) * measurement(BigFloat, c_0),
	"definition"
)



# ----------------------------------------------------------------------------------------------- #
