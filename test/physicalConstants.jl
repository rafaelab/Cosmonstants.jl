@testset "Physical constants" begin

	@testset "numeric expectations" begin
		@test isapprox(ustrip(Float64(SpeedOfLightInVacuum)), 2.99792458e8; rtol = 1e-15)
		@test isapprox(ustrip(Float64(PlanckConstant)), 6.62607015e-34; rtol = 1e-15)
		@test isapprox(ustrip(Float64(MassElectron)), 9.1093837139e-31; rtol = 1e-14)
	end

	@testset "aliases" begin
		@test DiracConstant === ReducedPlanckConstant
		@test MassElectron === ElectronMass
	end

	@testset "precision and uncertainties of Planck constant" begin
		gravity = measurement(NewtonianConstantOfGravitation)
		relativeGravityUncertainty = uncertainty(ustrip(gravity)) / value(ustrip(gravity))
		for constant ∈ (PlanckMass, PlanckEnergy, PlanckLength, PlanckTime)
			measured = ustrip(measurement(constant))
			measuredBig = ustrip(measurement(BigFloat, constant))
			@test measured isa Measurement{Float64}
			@test measuredBig isa Measurement{BigFloat}
			@test ustrip(measurement(Float32, constant)) isa Measurement{Float32}
			@test value(measured) == Float64(value(measuredBig))
			@test uncertainty(measured) == Float64(uncertainty(measuredBig))
			@test uncertainty(measured) / value(measured) ≈ relativeGravityUncertainty / 2

			# cancelling the dependence on G must also cancel its uncertainty.
			normalised = measurement(constant) / float(constant)
			gravityFactor = sqrt(gravity / float(NewtonianConstantOfGravitation))
			independent = constant ∈ (PlanckMass, PlanckEnergy) ? normalised * gravityFactor : normalised / gravityFactor
			@test uncertainty(ustrip(independent)) < 1e-18
		end
	end

end
