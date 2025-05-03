@testset "Units and Constants Tests" begin

	@testset "getUnitSystem (Real)" begin
		@test getUnitSystem(Float64) == PhysicalConstantsExtended.Unitless
		@test getUnitSystem(Int32) == PhysicalConstantsExtended.Unitless
	end

	@testset "getUnitSystem (Unitful)" begin
		@test PhysicalConstantsExtended.getUnitSystem(typeof(1 * u"m * A")) == PhysicalConstantsExtended.Unitfull
		@test PhysicalConstantsExtended.getUnitSystem(typeof(u"m / kg")) == PhysicalConstantsExtended.Unitfull
	end

	
end