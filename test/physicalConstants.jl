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

end
