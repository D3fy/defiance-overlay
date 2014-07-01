# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="CALID"
inherit perl-module

DESCRIPTION="A high level, transparent, OO interface to zeromq"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/zeromq
	dev-perl/Moo
	perl-core/Math-BigInt
	dev-perl/EV
	dev-perl/AnyEvent
	dev-perl/Sub-Exporter
	dev-perl/FFI-Raw
	dev-perl/namespace-autoclean
	virtual/perl-Time-HiRes
	dev-perl/Math-Int64
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
