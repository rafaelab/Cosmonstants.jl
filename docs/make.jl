using Documenter
using Unitful
using Cosmonstants
using Cosmonstants.Constants


DocMeta.setdocmeta!(Cosmonstants, :DocTestSetup, :(using Cosmonstants))


# remove items that are not constants to create table of constants
listOfConstants = getListOfConstants()


# generate list of constants (including the reexported ones from PhysicalConstants.jl (CODATA))
open(joinpath(@__DIR__, "src", "listOfConstants.md"), "w") do io
    print(io, 
		"""
		## List of constants

		Each dataset listed below exports by default only the full long names of the constants.  
		Short aliases are provided for convenience, but they are not exported, to avoid polluting the main namespace with dozens of short-named variables.
		Users can import the short names of the variables they use most frequently, as shown in the examples above.
		"""
	)
	println(io)
	println(io)
	println(io, "| Long name | Short | Value | Unit |")
	println(io, "| --------- | ----- | ----- | ---- |")
	for constant ∈ listOfConstants
		sym = @eval correspondingSymbol(Constants.$constant)
		u = @eval unit(Constants.$constant)
		u == Unitful.NoUnits ? "" : "`$(u)`"
		v = @eval Constants.$constant.val
		println(io, "| `", constant, "` | `", sym, "` | ", v, " | ", u, " |")
	end
end


makedocs(;
	sitename = "Cosmonstants.jl",
	format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
	modules = [Cosmonstants],
	# workdir = joinpath(@__DIR__, ".."),
	pages = [
		"Home" => "index.md",
		"List of constants" => "listOfConstants.md",
		"Unit toggler" => "unitToggler.md",
	]
)

deploydocs(;
	repo = "github.com/rafaelab/Cosmonstants.jl.git", 
	branch = "gh-pages",
	versions = nothing
)