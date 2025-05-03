# ----------------------------------------------------------------------------------------------- #
#
# Create aliases for some variables

const DiracConstant = ReducedPlanckConstant
export DiracConstant


# ----------------------------------------------------------------------------------------------- #
#
@derived_constant(PlanckConstantTimesSpeedOfLight,
	ħc, 
	"Planck constant times speed of light",
	convert(Float64, ustrip(big(ħ) * big(c_0))),
	ustrip(big(ħ) * big(c_0)), 
	u"J * m",
	measurement(ħ) * measurement(c_0),
	measurement(BigFloat, ħ) * measurement(BigFloat, c_0),
	"definition"
	)



# ----------------------------------------------------------------------------------------------- #