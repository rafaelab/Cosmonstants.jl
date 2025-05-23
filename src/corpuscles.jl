# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Helper function (unexported) to get the mass value of a particle in kg.

# Input
. `p`:: `ParticleType` object for `Corpuscles.jl` \\

# Output
. Particle mass (without explicit units) in kg.\\
"""
getCorpusclesParticleMassValue(p) = ustrip((p.mass.value |> u"J / c^2") / SpeedOfLightInVacuum ^ 2)


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
		return ustrip((p.mass.lower_limit |> u"J / c^2") / SpeedOfLightInVacuum ^ 2)
	else
		# @warn "Particle mass errors are not symmetric. The largest one will be chosen."
		return max(ustrip((p.mass.lower_limit |> u"J / c^2") / SpeedOfLightInVacuum ^ 2), ustrip((p.mass.upper_limit |> u"J / c^2") / SpeedOfLightInVacuum ^ 2))
	end
end



# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Macro to conveniently create objects like in `PhysicalConstants.jl` from particle masses contained in `Corpuscles.jl`.

# Input
. `particle`: a Corpuscles's `Particle`-type object
. `name`: explicit name of the variable of the corresponding constant
. `symbol`: short alias for the corresponding quantity (must be explicitly imported)
. `info`: string containing the details of the quantity.

# To do
. automatically retrieve PDG year (`Corpuscles._default_year`).
"""
macro createConstantsForMasses(particle, name, symbol, info)
	return quote
		@eval begin
			local _m  = $(getCorpusclesParticleMassValue)($particle)
            local _Δm = $(getCorpusclesParticleMassUncertainty)($particle)

			@constant(
				$name,
				$symbol,
				$info,
				_m,
				convert(BigFloat, _m),
				u"kg",
				_Δm,
				convert(BigFloat, _Δm),
				"PDG 2022 (from Corpuscles.jl)"
				)

			const $symbol = $name
		end
	end
end


# ----------------------------------------------------------------------------------------------- #
