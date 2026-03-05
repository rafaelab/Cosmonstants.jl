@testset "Corpuscles bridge" begin

	μ = Particle(13)
	mμ_symbol = Symbol("m_" * "\u03bc")

	@testset "mass helpers" begin
		@test isapprox(getCorpusclesParticleMassValue(μ), ustrip(Float64(MassMuon)); rtol = 1e-12)

		mass_uncertainty = uncertainty(measurement(MassMuon))
		@test isapprox(getCorpusclesParticleMassUncertainty(μ), ustrip(Float64(mass_uncertainty)); rtol = 1e-10)
	end

	@testset "macro exports" begin
		@test MassMuon === getfield(Cosmonstants, mμ_symbol)
	end

end
