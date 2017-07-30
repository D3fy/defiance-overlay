# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3 eutils user

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="The Bolo Monitoring System"
HOMEPAGE="https://github.com/bolo/bolo"

EGIT_REPO_URI="https://github.com/bolo/bolo"
LICENSE="GPL-3"
SLOT="0"
IUSE="core console +dbolo ffd influxdb meta postgres redis rrdtool slack sqlite test"

DEPEND="
	>=dev-libs/libvigor-1.1.0
	dev-libs/libpcre
	console? ( sys-libs/ncurses:0 )
	influxdb? ( net-misc/curl )
	redis? ( dev-libs/hiredis )
	rrdtool? ( net-analyzer/rrdtool )
	postgres? ( dev-db/postgresql:* )
	slack? ( net-misc/curl )
	sqlite? ( dev-db/sqlite )
	test? ( dev-libs/ctap )
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup bolo
	enewuser  bolo -1 -1 /var/lib/bolo bolo
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_with console console-subscriber) \
		$(use_with ffd ffd-subscriber) \
		$(use_with influxdb influxdb-subscriber) \
		$(use_with postgres pg-subscriber) \
		$(use_with redis redis-subscriber) \
		$(use_with rrdtool rrd-subscriber) \
		$(use_with sqlite sqlite-subscriber) \
		$(use_with slack slack-subscriber)
}

src_install() {
	einfo   "Installing Bolo Monitoring System"
	insinto  /etc/bolo
	insopts  -o bolo -g bolo
	doman    man/bolo-send.1
	dobin    bolo
	if use core; then
		einfo    "  Core"
		dosbin    bolo
		doman     man/bolo.conf.5 man/bolo.1       man/bolo-forget.1
		doman     man/bolo-name.1 man/bolo-query.1 man/bolo-cache.1
		doman     man/bolo-spy.1  man/bolo-aggr.1
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
	if use ffd; then
		einfo    "  Flat File Subscriber"
		dosbin    bolo2ffd
		doman     man/bolo2ffd.8
		newinitd "${FILESDIR}/bolo2ffd.initd" bolo2ffd
		newconfd "${FILESDIR}/bolo2ffd.confd" bolo2ffd
	fi
	if use influxdb; then
		einfo    "  InfluxDB Subscriber"
		dosbin    bolo2influxdb
		doman     man/bolo2influxdb.8
		newinitd "${FILESDIR}/bolo2influxdb.initd" bolo2influxdb
		newconfd "${FILESDIR}/bolo2influxdb.confd" bolo2influxdb
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
	if use redis; then
		einfo    "  Redis Subscriber"
		dosbin    bolo2redis
		doman     man/bolo2redis.8
		newinitd "${FILESDIR}/bolo2redis.initd" bolo2redis
		newconfd "${FILESDIR}/bolo2redis.confd" bolo2redis
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
	if use slack; then
		einfo    "  Slack Subscriber"
		dosbin    bolo2slack
		# doman     man/bolo2sqlite.8
		newinitd "${FILESDIR}/bolo2slack.initd" bolo2slack
		newconfd "${FILESDIR}/bolo2slack.confd" bolo2slack
	fi
}
