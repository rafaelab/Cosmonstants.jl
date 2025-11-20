@testset "Test unit toggler" begin

	@testset "getUnitSystem from numbers" begin
		@test getUnitSystem(Float64) == UnitlessSystem
		@test getUnitSystem(Int32) == UnitlessSystem
		@test getUnitSystem(typeof(1 * u"m * A")) == UnitfullSystem
		@test getUnitSystem(typeof(u"m / kg")) == UnitfullSystem
	end


	@testset "unit system dispatch" begin
		@test getUnitSystemModule(UnitlessSystem()) == Unitless
		@test getUnitSystemModule(UnitfullSystem()) == Unitfull
		@test getUnitSystemModule(UnitlessSystem) == Unitless
		@test getUnitSystemModule(UnitfullSystem) == Unitfull
	end

end