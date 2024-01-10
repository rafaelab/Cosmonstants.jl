# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Helper function (unexported) to get the mass value of a particle in kg.

# Input
. `p`:: `ParticleType` object for `Corpuscles.jl` \\

# Output
. Particle mass (without explicit units) in kg.\\
"""
getCorpusclesParticleMassValue(p) = ustrip(p.mass.value |> u"J / c^2")


# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Helper function (unexported) to get the mass uncertainty value of a particle in kg.
If lower and upper uncertainties are different, return the largest one of the two.
This is done to be fully consistent with `PhysicalConstants.jl`, which uses the package `Measurements.jl`, which does not accept asymmetric uncertainties.

# Input
. `p`:: `ParticleType` object for `Corpuscles.jl` \\

# Output
. Particle mass uncertainty (without explicit units) in kg.\\
"""
function getCorpusclesParticleMassUncertainty(p)
	if p.mass.lower_limit == p.mass.upper_limit
		return ustrip(p.mass.lower_limit |> u"J / c^2")
	else
		# @warn "Particle mass errors are not symmetric. The largest one will be chosen."
		return max(ustrip(p.mass.lower_limit |> u"J / c^2"), ustrip(p.mass.upper_limit |> u"J / c^2"))
	end
end

# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Macro to conveniently create objects like in `PhysicalConstants.jl` from particle masses contained in `Corpuscles.jl`.

# Input
. `particle`: a Corpuscles's `Particle`-type object \\
. `name`: explicit name of the variable of the corresponding constant \\
. `symbol`: short alias for the corresponding quantity (must be explicitly imported) \\
. `info`: string containing the details of the quantity.

# To do
. automatically retrieve PDG year (`Corpuscles._default_year`).
"""
macro createConstantsForMasses(particle, name, symbol, info)
	return quote
		@constant(
			$name,
			$symbol,
			$info,
			$(esc(getCorpusclesParticleMassValue))($(esc(particle))),
			convert(BigFloat, $(esc(getCorpusclesParticleMassValue))($(esc(particle)))),
			u"kg",
			$(esc(getCorpusclesParticleMassUncertainty))($(esc(particle))),
			convert(BigFloat, $(esc(getCorpusclesParticleMassUncertainty))($(esc(particle)))),
			"PDG 2022 (from Corpuscles.jl)"
		)
	end
end

# ----------------------------------------------------------------------------------------------- #
# 

# mass of fundamental particles
@createConstantsForMasses(Particle(1), MassQuarkDown, m_qd, "mass of the down quark")
@createConstantsForMasses(Particle(2), MassQuarkUp, m_qu, "mass of the up quark")
@createConstantsForMasses(Particle(3), MassQuarkStrange, m_qs, "mass of the strange quark")
@createConstantsForMasses(Particle(4), MassQuarkCharm, m_qc, "mass of the charm quark")
@createConstantsForMasses(Particle(5), MassQuarkBottom, m_qb, "mass of the bottom quark")
@createConstantsForMasses(Particle(6), MassQuarkTop, m_qt, "mass of the top quark")
@createConstantsForMasses(Particle(13), MassMuon, m_μ, "mass of the muon")
@createConstantsForMasses(Particle(15), MassTau, m_τ, "mass of the tau")
@createConstantsForMasses(Particle(23), MassNeutralBosonWeakInteraction, m_Z⁰, "mass of the neutral bosons of the weak interaction (Z⁰)")
@createConstantsForMasses(Particle(24), MassChargedBosonWeakInteraction, m_W, "mass of the charged bosons of the weak interaction (W⁺ and W⁻")

# mass of some hadrons
@createConstantsForMasses(Particle(111), MassNeutralPion, m_π⁰, "mass of the π⁰")
@createConstantsForMasses(Particle(211), MassChargedPion, m_π, "mass of the π⁺/π⁻")
@createConstantsForMasses(Particle(2214), MassDeltaPlus, m_Δ⁺, "mass of the Δ⁺ baryon")


# ----------------------------------------------------------------------------------------------- #
