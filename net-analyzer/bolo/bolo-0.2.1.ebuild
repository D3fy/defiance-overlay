# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base autotools-utils eutils user

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="The Bolo Monitoring System"
HOMEPAGE="https://github.com/filefrog/bolo"

SRC_URI="https://github.com/filefrog/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"
LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/ctap-1.1.5
	>=dev-libs/libvigor-1.1.0
	net-analyzer/rrdtool
	dev-libs/libpcre
	dev-libs/libvigor
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup bolo
	enewuser  bolo -1 -1 /var/lib/bolo bolo
}

src_install() {
	emake DESTDIR="${D}" install

	insinto  /etc
	newinitd "${FILESDIR}/bolo.initd" bolo
	doins    "${FILESDIR}/bolo.conf"
}
