# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="DAGOLDEN"

inherit perl-module

DESCRIPTION="Encrypted, expiring, compressed, serialized session data with integrity"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 amd64-fbsd x86 x86-fbsd x86-freebsd x64-freebsd amd64-linux x86-linux"
IUSE="test"

DEPEND="
	dev-perl/Moo
	>=dev-perl/MooX-Types-MooseLike-0.250.0
	dev-perl/String-Compare-ConstantTime
	dev-perl/Number-Tolerant
	dev-perl/crypt-cbc
	dev-perl/Crypt-Rijndael
	dev-perl/Crypt-URandom
	dev-perl/Sereal-Encoder
	dev-perl/Sereal-Decoder
	dev-perl/Math-Random-ISAAC-XS
	dev-perl/namespace-clean
	test? (
		dev-perl/Test-Deep
		dev-perl/Test-Fatal
	)
"
