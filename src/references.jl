# ----------------------------------------------------------------------------------------------- #
#
export 
	fullReference



# ----------------------------------------------------------------------------------------------- #
#

const _refCODATA2022 = 
	"+ CODATA2022 \n" * 
	"  \"CODATA recommended values of the fundamental physical constants: 2022\" \n " *
	"  P. J. Mohr, D. B. Newell, B. N. Taylor, E. Tiesinga \n" *
	"  Reviews of Modern Physics 97 (2025) 025002 \n " *
	"  http://doi.org/10.1103/RevModPhys.97.025002 \n "

const _refCODATA2018 = 
	"+ CODATA2018 \n" * 
	"  \"CODATA recommended values of the fundamental physical constants: 2018\" \n " *
	"  E. Tiesinga, P. J. Mohr, D. B. Newell, B. N. Taylor \n" *
	"  Reviews of Modern Physics 93 (2021) 025010 \n " *
	"  http://doi.org/10.1103/RevModPhys.93.025010 \n "

const _refPDG2022 = 
	"+ PDG2022 \n" * 
	"  \"Review of Particle Physics\" \n " *
	"  Particle Data Group (R. L. Workman et al.) \n" *
	"  Progress of Theoretical and Experimental Physics 2022 (2022) 083C01 \n " *
	"  http://doi.org/10.1093/ptep/ptac09 \n "

const _refIAU1976 = 
	"+ IAU1976 \n" *
	"  \"Recommendations [to the XVIth General Assembly, Grenoble, France, 1976]\" \n"
	"  IAU Commission 4 (Ephemerides)\n" *
	"  https://www.iau.org/static/resolutions/IAU1976_French.pdf"

const _refIAU2009 = 
	"+ IAU2009 \n" *
	"  \"The IAU 2009 system of astronomical constants: the report of the IAU working group on numerical standards for Fundamental Astronomy\" \n" *
	"  B. Luzum et al. \n" *
	"  Celestial Mechanics and Dynamical Astronomy 110 (2011) 293 \n" *
	"  http://doi.org/10.1007/s10569-011-9352-4"

const _refIAU2015 = 
	"+ IAU2015 \n" *
	"  \"IAU 2015 Resolution B3 on Recommended Nominal Conversion Constants for Selected Solar and Planetary Properties\" \n" *
	"  E. E. Mamajek et al. \n" *
	"  https://doi.org/10.48550/arXiv.1510.07674"

const _refATLAS2024 = 
	"+ ATLAS2024 \n" *
	"  \"A precise determination of the strong-coupling constant from the recoil of Z bosons with the ATLAS experiment at s√=8 TeV\" \n" *
	"  ATLAS Collaboration \n" *
	"  https://doi.org/10.48550/arXiv.2309.12986"


# ----------------------------------------------------------------------------------------------- #
# 
@doc """
The dictionary of references.
"""
const referencesDict = Dict(
	"CODATA2022" => _refCODATA2022,
	"CODATA2018" => _refCODATA2018,
	"PDG2022" => _refPDG2022,
	"IAU1976" => _refIAU1976,
	"IAU2009" => _refIAU2009,
	"IAU2015" => _refIAU2015,
	"ATLAS2024" => _refATLAS2024,
	"definition" => "by definition",
	"?" => "unknown reference",
	)


# ----------------------------------------------------------------------------------------------- #
# 
@doc """
Get the full reference for a given source of information.
"""
@inline fullReference(ref::AbstractString) = begin
	return referencesDict[replace(ref, " " => "")]
end


# ----------------------------------------------------------------------------------------------- #
