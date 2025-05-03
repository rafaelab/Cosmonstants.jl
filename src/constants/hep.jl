# ----------------------------------------------------------------------------------------------- #
# 

# mass of fundamental particles
# @createConstantsForMasses(Particle(1), MassQuarkDown, m_qd, "mass of the down quark")
# @createConstantsForMasses(Particle(2), MassQuarkUp, m_qu, "mass of the up quark")
# @createConstantsForMasses(Particle(3), MassQuarkStrange, m_qs, "mass of the strange quark")
# @createConstantsForMasses(Particle(4), MassQuarkCharm, m_qc, "mass of the charm quark")
# @createConstantsForMasses(Particle(5), MassQuarkBottom, m_qb, "mass of the bottom quark")
# @createConstantsForMasses(Particle(6), MassQuarkTop, m_qt, "mass of the top quark")
# @createConstantsForMasses(Particle(13), MassMuon, m_μ, "mass of the muon")
# @createConstantsForMasses(Particle(15), MassTau, m_τ, "mass of the tau")
# @createConstantsForMasses(Particle(23), MassNeutralBosonWeakInteraction, m_Z⁰, "mass of the neutral bosons of the weak interaction [Z⁰]")
# @createConstantsForMasses(Particle(24), MassChargedBosonWeakInteraction, m_W, "mass of the charged bosons of the weak interaction [W⁺ and W⁻]")

# # mass of some hadrons
# @createConstantsForMasses(Particle(111), MassNeutralPion, m_π⁰, "mass of the π⁰")
# @createConstantsForMasses(Particle(211), MassChargedPion, m_π, "mass of the charged pion [π⁺/π⁻]")
# @createConstantsForMasses(Particle(2214), MassDeltaPlus, m_Δ⁺, "mass of the Δ⁺ baryon")


# ----------------------------------------------------------------------------------------------- #
# 
# @constant(ReducedFermiCouplingConstant, 
# 	G_F0, 
# 	"reduced Fermi coupling constant", 
# 	454_379_570_000_000.0,
# 	BigFloat(454_379_570_000_000.0), 
# 	u"1 / J ^ 2",
# 	3_744_897.5770,
# 	BigFloat(3_744_8975770) / BigFloat(10000),
# 	"CODATA 2022"
# 	)


# @derived_constant(FermiCouplingConstant,
# 	G_F,
# 	"Fermi coupling constant",
# 	convert(Float64, ustrip(big(G_F0) * (big(c_0) * big(ħ)) ^ 3)),
# 	ustrip(big(G_F0) * (big(c_0) * big(ħ)) ^ 3), 
# 	u"1 / J ^ 2",
# 	measurement(G_F0) * (measurement(c_0) * measurement(ħ)) ^ 3,
# 	measurement(BigFloat, G_F0) * (measurement(BigFloat, c_0) * measurement(BigFloat, ħ)) ^ 3,
# 	"CODATA 2022"
# 	)

# 	# PhysicalConstants.@derived_constant(MyDerivedConstant, mdc, "A custom derived constant",
# 	# 96.252, ustrip(big(mc)) * BigFloat(78) / BigFloat(10), u"m/s",
# 	# measurement(mc) * 7.8, measurement(BigFloat, mc)  * BigFloat(78) / BigFloat(10),
# 	# "My lab notebook")

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
export ElectromagneticFineStructureConstant

const α_em = FineStructureConstant


# ----------------------------------------------------------------------------------------------- #