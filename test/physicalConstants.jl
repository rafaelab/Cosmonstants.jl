

# @testset "PhysicalConstants tests" begin
# 	# tests from PhysicalConstants.jl
# 	@test ustrip(BigFloat(PlanckConstant)) == big"6.626070149999999829724906675746281728527609958779240426308498208281271559371644e-34"
# 	@test setprecision(BigFloat, 128) do; precision(ustrip(big(SpeedOfLightInVacuum))) end == 128
# 	@test measurement(PlanckConstant) === measurement(PlanckConstant)
# end

# @testset "Measurements" begin
# 	@test iszero(measurement(BigFloat, DiracConstant) - (measurement(BigFloat, PlanckConstant) / 2big(π)))
# 	@test isone(measurement(BigFloat, DiracConstant) / (measurement(BigFloat, PlanckConstant) / 2big(π)))
# end

# @testset "Unitful" begin
# 	@test SpeedOfLightInVacuum.val === ustrip(Float64(SpeedOfLightInVacuum))
# 	@test DiracConstant.val === ustrip(Float64(DiracConstant))
# 	@test_throws ErrorException SpeedOfLightInVacuum.bla
# end

# # @testset "Physical Constants Tests" begin
# # 	@test ustrip(EarthRadius) ≈ 6.3781e6 rtol = 1e-10
# # 	@test ustrip(DiracConstant) ≈ 1.0545718176461565e-34 rtol = 1e-15

# # 	# Test units
# # 	@test unit(MassTau) == u"kg"
# # 	@test unit(MassNeutralBosonWeakInteraction) == u"kg"
# # 	@test unit(MassNeutralPion) == u"kg"
# # end

# # @testset "Helper Functions Tests" begin
# # 	constants = getListOfConstants()

# # 	@test "MassTau" ∈ constants
# # 	@test "MassNeutralBosonWeakInteraction" ∈ constants
# # 	@test "MassNeutralPion" ∈ constants
# # end

# # @testset "Reexported Constants Tests" begin
# # 	@test PlanckConstant ≈ 6.62607015e-34 rtol = 1e-15
# # 	@test SpeedOfLightInVacuum ≈ 299792458.0 rtol = 1e-15
# # 	@test ElementaryCharge ≈ 1.602176634e-19 rtol = 1e-15
# # 	@test ElectronMass ≈ 9.10938356e-31 rtol = 1e-15
# # end

# # # @testset "Unitful Compatibility Tests" begin
# # #     @test isapprox(MassTau |> u"g", 2.8468435738892393e-7, rtol = 1e-12)
# # #     @test isapprox(EarthMass |> u"lb", 1.316e25, rtol = 1e21)
# # #     @test isapprox(MassTau + MassNeutralPion, 2.162566750920912e-11 + 2.8468435738892393e-10, atol=1e-15)
# # # end