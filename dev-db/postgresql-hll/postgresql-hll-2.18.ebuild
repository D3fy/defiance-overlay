# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 14 15 16 )
POSTGRES_USEDEP="server"

inherit postgres-multi

SLOT="0"

DESCRIPTION="PostgreSQL extension adding HyperLogLog data structures as a native data type"
HOMEPAGE="https://github.com/citusdata/postgresql-hll"
SRC_URI="https://github.com/citusdata/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
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
