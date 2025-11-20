# ----------------------------------------------------------------------------------------------- #
# 
@constant(SolarMass,
	M☉,
	"mass of the Sun",
	1.98847e30,
	BigFloat(1.98847e30),
	u"kg",
	0.00007e30,
	BigFloat(0.00007e30),
	"IAU1976"
)

@constant(EarthMass,
	M🜨,
	"mass of the Earth",
	5.9722e24,
	BigFloat(5.9722e24),
	u"kg",
	0.0006e24,
	BigFloat(0.0006e24),
	"IAU2009"
)

@constant(SolarRadius,
	R☉,
	"radius of the Sun at the Equator",
	6.95660e11,
	BigFloat(6.95660e11),
	u"m",
	1.4e5,
	BigFloat(140000),
	"IAU2015"
)

# uncertainty is the difference between equatorial and polar radii
@constant(EarthRadius,
	R🜨,
	"radius of the Earth at the Equator",
	6.3781e6,
	BigFloat(6.3781e6),
	u"m",
	21300.,
	BigFloat(21300),
	"IAU2015"
)

# ----------------------------------------------------------------------------------------------- #
