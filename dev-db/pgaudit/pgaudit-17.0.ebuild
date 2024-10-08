# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 17 )
POSTGRES_USEDEP="server"

inherit postgres-multi multilib

DESCRIPTION="Open Source PostgreSQL Audit Logging"
HOMEPAGE="http://pgaudit.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="17"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="
	${POSTGRES_DEP}
"
RDEPEND="
	${DEPEND}
"

src_prepare() {
	eapply_user
	sed -e 's/PG_CONFIG\s\+=/PG_CONFIG\ ?=/' -i Makefile
	postgres-multi_src_prepare
}

src_compile() {
	export USE_PGXS=1
	postgres-multi_foreach emake
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install

	use static-libs || find "${ED}" -name '*.a' -delete
}
