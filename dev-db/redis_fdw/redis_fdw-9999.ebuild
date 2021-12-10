# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 12 13 14 )
POSTGRES_USEDEP="server"

inherit eutils git-r3 postgres-multi

SLOT="0"

DESCRIPTION="A PostgreSQL foreign data wrapper for Redis"
HOMEPAGE="https://github.com/pg-redis-fdw/redis_fdw"
EGIT_REPO_URI="https://github.com/pg-redis-fdw/redis_fdw"
EGIT_BRANCH="REL_13_STABLE"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="
	${POSTGRES_DEP}
	dev-libs/hiredis
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
