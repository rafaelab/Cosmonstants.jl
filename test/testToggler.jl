@testset "Units and Constants Tests" begin

	@testset "getUnitSystem (Real)" begin
		@test getUnitSystem(Float64) == Cosmonstants.Unitless
		@test getUnitSystem(Int32) == Cosmonstants.Unitless
	end

	@testset "getUnitSystem (Unitful)" begin
		@test Cosmonstants.getUnitSystem(typeof(1 * u"m * A")) == Cosmonstants.Unitfull
		@test Cosmonstants.getUnitSystem(typeof(u"m / kg")) == Cosmonstants.Unitfull
	end

	
end