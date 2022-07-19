# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="GBARR"
inherit perl-module

DESCRIPTION="Code to glue Perl SASL to Cyrus SASL"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	dev-libs/cyrus-sasl
	dev-perl/Devel-CheckLib
	dev-perl/Authen-SASL
	${RDEPEND}"
