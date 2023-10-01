# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 14 15 16 )
POSTGRES_USEDEP="server"

inherit git-r3 postgres-multi

SLOT="0"

DESCRIPTION="Gather statistics about disk access and CPU consumption done by backends"
HOMEPAGE="https://github.com/powa-team/pg_stat_kcache"
EGIT_REPO_URI="https://github.com/powa-team/${PN}"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"
REQUIRED_USE="${POSTGRES_REQ_USE}"

DEPEND="${POSTGRES_DEP}"
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
