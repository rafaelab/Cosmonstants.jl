@testset "Test unit toggler" begin

	@testset "getUnitSystem from numbers" begin
		@test getUnitSystem(Float64) == Unitless
		@test getUnitSystem(Int32) == Unitless
		@test getUnitSystem(typeof(1 * u"m * A")) == Unitfull
		@test getUnitSystem(typeof(u"m / kg")) == Unitfull
	end


	@testset "unit system dispatch" begin
		@test getUnitSystem(UnitlessSystem()) == Unitless
		@test getUnitSystem(UnitfullSystem()) == Unitfull
		@test getUnitSystem(UnitlessSystem) == Unitless
		@test getUnitSystem(UnitfullSystem) == Unitfull
		@test_throws ArgumentError getUnitSystem(String)
	end

end