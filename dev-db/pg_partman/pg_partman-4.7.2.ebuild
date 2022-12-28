# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 13 14 15 )
POSTGRES_USEDEP="server"

inherit eutils postgres-multi

SLOT="0"

DESCRIPTION="Postgres time and serial partitioner"
HOMEPAGE="https://github.com/keithf4/pg_partman"
SRC_URI="https://github.com/keithf4/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="
	${POSTGRES_DEP}
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	postgres-multi_src_prepare
}

src_compile() {
	postgres-multi_foreach emake
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install

	use static-libs || find "${ED}" -name '*.a' -delete
}
