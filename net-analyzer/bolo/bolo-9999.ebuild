# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base autotools-utils git-2 eutils user

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="The Bolo Monitoring System"
HOMEPAGE="https://github.com/bolo/bolo"

EGIT_REPO_URI="https://github.com/bolo/bolo"
LICENSE="GPL-3"
SLOT="0"
IUSE="core +dbolo meta postgres rrdtool sqlite"

DEPEND="
	>=dev-libs/ctap-1.1.5
"
RDEPEND="
	>=dev-libs/libvigor-1.1.0
	dev-libs/libpcre
	rrdtool? ( net-analyzer/rrdtool )
	postgres? ( dev-db/postgresql:* )
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
	einfo   "Installing Bolo Monitoring System"
	insinto  /etc/bolo
	insopts  -o bolo -g bolo
	doman    man/send_bolo.1 man/stat_bolo.1
	dobin    send_bolo stat_bolo bolospy bolo_nsca
	if use core; then
		einfo    "  Core"
		dosbin    bolo
		doman     man/bolo.conf.5 man/bolo.8
		doins    "${FILESDIR}/bolo.conf"
		newinitd "${FILESDIR}/bolo.initd" bolo
		newinitd "${FILESDIR}/bolo2log.initd" bolo2log
		newconfd "${FILESDIR}/bolo2log.confd" bolo2log
	fi
	if use dbolo; then
		einfo    "  Client Daemon"
		dosbin    dbolo
		doman     man/dbolo.1 man/dbolo.conf.5
		newinitd "${FILESDIR}/dbolo.initd" dbolo
		newconfd "${FILESDIR}/dbolo.confd" dbolo
	fi
	if use meta; then
		einfo    "  Meta Subscriber"
		dosbin    bolo2meta
		doman     man/bolo2meta.8
		newinitd "${FILESDIR}/bolo2meta.initd" bolo2meta
		newconfd "${FILESDIR}/bolo2meta.confd" bolo2meta
	fi
	if use postgres; then
		einfo    "  Postgres Subscriber"
		dosbin    bolo2pg
		doman     man/bolo2pg.8
		insopts  -m 0400
		doins    "${FILESDIR}/pg.creds"
		insopts  -m 0644
		newinitd "${FILESDIR}/bolo2pg.initd" bolo2pg
		newconfd "${FILESDIR}/bolo2pg.confd" bolo2pg
	fi
	if use rrdtool; then
		einfo    "  RRD Subscriber"
		dosbin    bolo2rrd
		doman     man/bolo2rrd.8
		newinitd "${FILESDIR}/bolo2rrd.initd" bolo2rrd
		newconfd "${FILESDIR}/bolo2rrd.confd" bolo2rrd
	fi
	if use sqlite; then
		einfo    "  Sqlite Subscriber"
		dosbin    bolo2sqlite
		# doman     man/bolo2sqlite.8
		newinitd "${FILESDIR}/bolo2sqlite.initd" bolo2sqlite
		newconfd "${FILESDIR}/bolo2sqlite.confd" bolo2sqlite
	fi
}
