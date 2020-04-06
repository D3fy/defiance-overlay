# Distributed under the terms of the GNU General Public License v2

EAPI=6

POSTGRES_COMPAT=( 10 )
POSTGRES_USEDEP="server"

inherit eutils postgres-multi versionator

SLOT="0"

DESCRIPTION="Partitioning tool for PostgreSQL"
HOMEPAGE="https://github.com/postgrespro/pg_pathman"
SRC_URI="https://github.com/postgrespro/${PN}/archive/${PV}.tar.gz"

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
	postgres-multi_foreach emake USE_PGXS=1
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install USE_PGXS=1

	use static-libs || find "${ED}" -name '*.a' -delete
}
