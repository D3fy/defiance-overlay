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
"
RDEPEND="
	>=dev-libs/libvigor-1.1.0
	dev-libs/libpcre
	rrdtool? ( net-analyzer/rrdtool )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-db/sqlite )
"

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
	newinitd "${FILESDIR}/bolo.initd" bolo
	if use postgres; then
		doins    "${FILESDIR}/pg.creds"
		newinitd "${FILESDIR}/bolo2pg.initd" bolo2pg
		newconfd "${FILESDIR}/bolo2pg.confd" bolo2pg
	fi
	if use rrdtool; then
		newinitd "${FILESDIR}/bolo2rrd.initd" bolo2rrd
		newconfd "${FILESDIR}/bolo2rrd.confd" bolo2rrd
	fi
	newinitd "${FILESDIR}/bolo2log.initd" bolo2log
	newconfd "${FILESDIR}/bolo2log.confd" bolo2log
}
