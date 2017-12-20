# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

POSTGRES_COMPAT=( 10 )
POSTGRES_USEDEP="server"

inherit cmake-multilib eutils postgres-multi versionator

DESCRIPTION="A time-series database optimized for fast ingest and complex queries"
HOMEPAGE="http://www.timescale.com/"
SRC_URI="https://github.com/timescale/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="static-libs"
KEYWORDS="~amd64 ~x86"

DEPEND="
	${POSTGRES_DEP}
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	eapply_user
	postgres-multi_src_prepare
}
src_configure() {
	postgres-multi_foreach cmake-utils_src_configure
}

src_compile() {
	postgres-multi_foreach emake
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" install

	use static-libs || find "${ED}" -name '*.a' -delete
}
