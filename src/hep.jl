@constant(ReducedFermiCouplingConstant, 
	G_F0, 
	"reduced Fermi coupling constant", 
	4.543_7957e14,
	BigFloat(454_379_570_000_000), 
	u"J ^ (-2)",
	2.317_335_807e8,
	BigFloat(2_317_335_807) / BigFloat(10),
	"CODATA 2018"
	)

@constant(FermiCouplingConstant,
	G_F,
	"Fermi coupling constant",
	1.435_851_043_785_878e-62,
	ustrip(big(G_F0) * big(c_0) ^ 3 * big(ħ) ^ 3),
	u"J * m ^ 3",
	7.322_840_323_307_9782e-69,
	BigFloat(7.322_840_323_307_9782e-69),
	"CODATA 2018"
	)

@constant(SinWeinbergAngleSquared, 
	sinθW2, 
	"sine of the Weinberg Angle squared", 
	0.22290,
	BigFloat(0.22290), 
	u"°",
	0.00030,
	BigFloat(0.00030),
	"CODATA 2018"
	)

@constant(WeinbergAngle, 
	θ_W, 
	"Weinberg angle", 
	28.172,
	BigFloat(28_172) / BigFloat(1_000), 
	u"°",
	0.021,
	BigFloat(21) / BigFloat(1000),
	"CODATA 2018"
	)

@constant(StrongFineStructureConstant, 
	α_s, 
	"strong force coupling constant", 
	0.1183,
	BigFloat(1183) / BigFloat(10_000), 
	u"J / J",
	0.0009,
	BigFloat(9) / BigFloat(10_000),
	"ATLAS 2023"
	)

@constant(GravitationalFineStructureConstant, 
	α_G, 
	"gravitational interaction fine-structure constant", 
	5.906_149_413_805_093_953e-39,
	BigFloat(5.906_149_413_805_093_953e-39), 
	u"J / J",
	0.,
	BigFloat(0),
	"?"
	)

const ElectromagneticFineStructureConstant = FineStructureConstant
const α_em = FineStructureConstant
