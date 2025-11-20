@testset "Test unit toggler" begin

	@testset "getUnitSystem from quantities" begin
		@test getUnitSystem(Float64) isa UnitlessSystem
		@test getUnitSystem(Int32) isa UnitlessSystem
		@test getUnitSystem(typeof(1 * u"m * A"))  isa UnitfullSystem
		@test getUnitSystem(typeof(u"m / kg")) isa UnitfullSystem
		@test getUnitSystem(u"s") isa UnitfullSystem
		@test getUnitSystem([1. 2.; 3 4]) isa UnitlessSystem
	end


	@testset "unit system dispatch" begin
		@test getUnitSystemModule(UnitlessSystem()) == Unitless
		@test getUnitSystemModule(UnitfullSystem()) == Unitfull
		@test getUnitSystemModule(UnitlessSystem) == Unitless
		@test getUnitSystemModule(UnitfullSystem) == Unitfull
	end

	@testset "test equivalence between property access and direct module access" begin
		ul = UnitlessSystem()
		uf = UnitfullSystem()

		@test ul.c == Unitless.c
		@test ul.h == Unitless.h
		@test ul.G == Unitless.G
		@test uf.c == Unitfull.c
		@test uf.h == Unitfull.h
		@test uf.G == Unitfull.G
	end

end