# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="SORTIZ"
inherit perl-module

DESCRIPTION="Tie to LMDB (OpenLDAP's Lightning Memory-Mapped Database)"

LICENSE="Artistic"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="
	dev-db/lmdb
	${RDEPEND}
"

SRC_TEST="do"
