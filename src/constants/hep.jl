# ----------------------------------------------------------------------------------------------- #
#
export
	ElectromagneticFineStructureConstant,
	MassQuarkDown,
	MassQuarkUp,
	MassQuarkStrange,
	MassQuarkCharm,
	MassQuarkBottom,
	MassQuarkTop,
	MassMuon,
	MassTau,
	MassPhoton,
	MassNeutralBosonWeakInteraction,
	MassChargedBosonWeakInteraction,
	MassHiggsBoson,
	MassNeutralPion,
	MassChargedPion,
	MassDeltaPlus,
	MassElectron,
	MassProton,
	MassNeutron,
	PlanckMass,
	PlanckEnergy,
	PlanckLength,
	PlanckTime,
	FermiCouplingConstant,
	WeinbergAngle,
	StrongFineStructureConstant,
	GravitationalFineStructureConstant


# ----------------------------------------------------------------------------------------------- #
# 
# mass of fundamental particles (must be exported manually)
@createConstantsForMasses(Particle(1), MassQuarkDown, m_qd, "mass of the down quark")
@createConstantsForMasses(Particle(2), MassQuarkUp, m_qu, "mass of the up quark")
@createConstantsForMasses(Particle(3), MassQuarkStrange, m_qs, "mass of the strange quark")
@createConstantsForMasses(Particle(4), MassQuarkCharm, m_qc, "mass of the charm quark")
@createConstantsForMasses(Particle(5), MassQuarkBottom, m_qb, "mass of the bottom quark")
@createConstantsForMasses(Particle(6), MassQuarkTop, m_qt, "mass of the top quark")
@createConstantsForMasses(Particle(13), MassMuon, m_μ, "mass of the muon")
@createConstantsForMasses(Particle(15), MassTau, m_τ, "mass of the tau")
@createConstantsForMasses(Particle(21), MassGluon, m_g, "mass of the gluon")
@createConstantsForMasses(Particle(22), MassPhoton, m_γ, "mass of the photon")
@createConstantsForMasses(Particle(23), MassNeutralBosonWeakInteraction, m_Z⁰, "mass of the neutral bosons of the weak interaction [Z⁰]")
@createConstantsForMasses(Particle(24), MassChargedBosonWeakInteraction, m_W, "mass of the charged bosons of the weak interaction [W⁺ and W⁻]")
@createConstantsForMasses(Particle(25), MassHiggsBoson, m_H, "mass of the Higgs boson")

# mass of some hadrons
@createConstantsForMasses(Particle(111), MassNeutralPion, m_π⁰, "mass of the π⁰")
@createConstantsForMasses(Particle(211), MassChargedPion, m_πᶜ, "mass of the charged pion [π⁺/π⁻]")
@createConstantsForMasses(Particle(2214), MassDeltaPlus, m_Δ⁺, "mass of the Δ⁺ baryon")

# redefinitions for consistency
const MassElectron = ElectronMass
const MassProton = ProtonMass
const MassNeutron = NeutronMass


# ----------------------------------------------------------------------------------------------- #
# 
@derived_constant(PlanckMass,
	m_Pl,
	"Planck mass",
	convert(Float64, ustrip(sqrt(big(ħc) / big(G)))),
	convert(BigFloat, ustrip(sqrt(big(ħc) / big(G)))),
	u"kg",
	sqrt(measurement(ħc) / measurement(G)),
	sqrt(measurement(BigFloat, ħc) / measurement(BigFloat, G)),
	"definition"
)

@derived_constant(PlanckEnergy,
	E_Pl,
	"Planck energy",
	convert(Float64, ustrip(sqrt(big(m_Pl) * big(c_0) ^ 2 / big(G)))),
	convert(BigFloat, ustrip(sqrt(big(m_Pl) * big(c_0) ^ 2 / big(G)))),
	u"J",
	sqrt(measurement(m_Pl) * measurement(c_0) ^ 2 / measurement(G)),
	sqrt(measurement(BigFloat, m_Pl) * measurement(BigFloat, c_0) ^ 2 / measurement(BigFloat, G)),
	"definition"
)

@derived_constant(PlanckLength,
	ℓ_Pl,
	"Planck length",
	convert(Float64, ustrip( sqrt( big(ħ) * big(G) / big(c_0) ^ 3))),
	convert(BigFloat, ustrip( sqrt( big(ħ) * big(G) / big(c_0) ^ 3))),
	u"m",
	sqrt(measurement(ħ) * measurement(G) / measurement(c_0) ^ 3),
	sqrt(measurement(BigFloat, ħ) * measurement(BigFloat, G) / measurement(BigFloat, c_0) ^ 3),
	"definition"
)

@derived_constant(PlanckTime,
	t_Pl,
	"Planck time",
	convert(Float64,
	ustrip(sqrt(big(ħ) * big(G) / big(c_0) ^ 5))),
	convert(BigFloat, ustrip( sqrt( big(ħ) * big(G) / big(c_0) ^ 5))),
	u"s",
	sqrt(measurement(ħ) * measurement(G) / measurement(c_0) ^ 5),
	sqrt(measurement(BigFloat, ħ) * measurement(BigFloat, G) / measurement(BigFloat, c_0) ^ 5),
	"definition"
)


# ----------------------------------------------------------------------------------------------- #
# 
@constant(ReducedFermiCouplingConstant, 
	G_F0, 
	"reduced Fermi coupling constant", 
	4.5437957e14,
	BigFloat(454_379_570_000_000), 
	u"J ^ (-2)",
	3.744897577e8,
	BigFloat(37_448_975_770) / BigFloat(100),
	"CODATA2022"
)

@derived_constant(FermiCouplingConstant,
	G_F,
	"Fermi coupling constant",
	convert(Float64, ustrip(big(G_F0) * big(ħc))),
	convert(BigFloat, ustrip(big(G_F0) * big(ħc))), 
	u"J^(-2)",
	measurement(G_F0) * measurement(ħc),
	measurement(BigFloat, G_F0) * measurement(BigFloat, ħc),
	"definition"
)

# ----------------------------------------------------------------------------------------------- #
# 
@constant(SinWeinbergAngleSquared, 
	sinθW², 
	"sine of the Weinberg Angle squared", 
	0.22290,
	BigFloat(22290) / BigFloat(100_000), 
	Unitful.NoUnits,
	0.00030,
	BigFloat(30) / BigFloat(100_000),
	"CODATA2018"
)

@derived_constant(WeinbergAngle,
	θ_W,
	"Weinberg angle",
	convert(Float64, ustrip(asin(sqrt(big(sinθW²))))),
	convert(BigFloat, ustrip(asin(sqrt(big(sinθW²))))),
	Unitful.NoUnits,
	asin(sqrt(measurement(Float64(value(big(sinθW²))), Float64(uncertainty(big(sinθW²)))))),
	asin(sqrt(measurement(value(big(sinθW²)), uncertainty(big(sinθW²))))),
	"definition"
)


# ----------------------------------------------------------------------------------------------- #
# 
@constant(StrongFineStructureConstant, 
	α_s, 
	"strong force coupling constant", 
	0.1183,
	BigFloat(1183) / BigFloat(10_000), 
	Unitful.NoUnits,
	0.0009,
	BigFloat(9) / BigFloat(10_000),
	"ATLAS2024"
)

@constant(GravitationalFineStructureConstant, 
	α_G, 
	"gravitational interaction fine-structure constant", 
	5.906_149_413_805_093_953e-39,
	BigFloat(5.906_149_413_805_093_953e-39), 
	Unitful.NoUnits,
	0.,
	BigFloat(0),
	"definition"
)

const ElectromagneticFineStructureConstant = FineStructureConstant
const α_em = FineStructureConstant


# ----------------------------------------------------------------------------------------------- #