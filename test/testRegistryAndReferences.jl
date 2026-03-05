@testset "Registry and references" begin

	@testset "constant registry" begin
		constants = getListOfConstants()

		@test :SpeedOfLightInVacuum ∈ constants
		@test :SolarMass ∈ constants
		@test correspondingSymbol(SpeedOfLightInVacuum) == :c_0
		@test correspondingSymbol(SolarMass) == :M☉
	end

	@testset "reference fallback" begin
		@test occursin("CODATA2022", fullReference("CODATA2022"))
		@test fullReference("does-not-exist") == "unknown reference"
		@test fullReference("   does not exist   ") == "unknown reference"
	end

end
