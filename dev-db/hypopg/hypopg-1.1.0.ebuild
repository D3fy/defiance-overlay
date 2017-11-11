# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

POSTGRES_COMPAT=( 10 )
POSTGRES_USEDEP="server"

inherit eutils postgres-multi versionator

SLOT="0"

DESCRIPTION="Hypothetical Indexes for PostgreSQL"
HOMEPAGE="http://dalibo.github.io/hypopg/"
SRC_URI="https://github.com/dalibo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
