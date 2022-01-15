# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 13 14 )
POSTGRES_USEDEP="server"

inherit eutils git-r3 postgres-multi

SLOT="0"

DESCRIPTION="kafka foreign database wrapper for postresql"
HOMEPAGE="https://github.com/adjust/kafka_fdw"
EGIT_REPO_URI="https://github.com/adjust/${PN}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="
	${POSTGRES_DEP}
	dev-libs/librdkafka
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
	postgres-multi_src_prepare
}

src_compile() {
	postgres-multi_foreach emake
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install

	use static-libs || find "${ED}" -name '*.a' -delete
}
