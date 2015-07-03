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
IUSE="postgres rrdtool sqlite"

DEPEND="
	>=dev-libs/ctap-1.1.5
	>=dev-libs/libvigor-1.1.0
	net-analyzer/rrdtool
	dev-libs/libpcre
	dev-db/postgresql
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup bolo
	enewuser  bolo -1 -1 /var/lib/bolo bolo
}

src_configure() {
	econf \
		$(use_with postgres pg-subscriber) \
		$(use_with rrdtool rrd-subscriber) \
		$(use_with sqlite sqlite-subscriber)
}

src_install() {
	emake DESTDIR="${D}" install

	einfo "Install init scripts"
	insinto  /etc/bolo
	insopts  -o bolo -g bolo
	doins    "${FILESDIR}/bolo.conf"
	insopts  -m 0400
	doins    "${FILESDIR}/pg.creds"
	newinitd "${FILESDIR}/bolo.initd" bolo
	newinitd "${FILESDIR}/bolo2pg.initd" bolo2pg
	newconfd "${FILESDIR}/bolo2pg.confd" bolo2pg
	newinitd "${FILESDIR}/bolo2rrd.initd" bolo2rrd
	newconfd "${FILESDIR}/bolo2rrd.confd" bolo2rrd
}
