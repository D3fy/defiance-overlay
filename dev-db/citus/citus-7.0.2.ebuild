# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

SLOT="0"

DESCRIPTION="Scalable PostgreSQL for multi-tenant and real-time workloads"
HOMEPAGE="https://www.citusdata.com/"
SRC_URI="https://github.com/citusdata/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
src_install() {
	emake DESTDIR="${D}" install
}
