using Documenter
using Unitful
using PhysicalConstantsExtended


DocMeta.setdocmeta!(PhysicalConstantsExtended, :DocTestSetup, :(using PhysicalConstantsExtended))


# remove items that are not constants to create table of constants
listOfConstants = getListOfConstants()


# generate list of constants (including the reexported ones from PhysicalConstants.jl (CODATA2018))
open(joinpath(@__DIR__, "src", "listOfConstants.md"), "w") do io
    print(io, 
		"""
		## List of Set of Constants

		Each dataset listed below exports by default only the full
		long names of the constants.  Short aliases are provided for
		convenience, but they are not exported, to avoid polluting
		the main namespace with dozens of short-named variables.
		Users can to import the short names of the variables they
		use most frequently, as shown in the examples above.
		"""
	)

	println(io)
	println(io)
	println(io, "| Long name | Short | Value | Unit |")
	println(io, "| --------- | ----- | ----- | ---- |")

	for constant in listOfConstants
		sym = correspondingSymbol(constant)
		c = @eval float($constant)
		println(io, "| `", constant, "` | `", sym, "` | ", ustrip(float(c)), " | ", unit(c) == Unitful.NoUnits ? "" : "`$(unit(c))`", " |")
	end
end



makedocs(
	sitename = "PhysicalConstantsExtended.jl",
	format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
	modules = [PhysicalConstantsExtended],
	# workdir = joinpath(@__DIR__, ".."),
	pages = [
		"Home" => "index.md",
		"List of constants" => "listOfConstants.md",
	]
)

deploydocs(repo = "github.com/rafaelab/PhysicalConstantsExtended.jl.git", versions = nothing)