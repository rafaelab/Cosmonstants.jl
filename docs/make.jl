using Documenter


DocMeta.setdocmeta!(PhysicalConstantsExtended, :DocTestSetup, :(using PhysicalConstantsExtended))



makedocs(
	sitename = "PhysicalConstantsExtended.jl",
	format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
	modules = [Longinus],
	workdir = joinpath(@__DIR__, ".."),
	pages = [
		"PhysicalConstantsExtended: Home" => "index.md",
	]
)

deploydocs(repo = "github.com/rafaelab/PhysicalConstantsExtended.jl.git", versions = nothing)