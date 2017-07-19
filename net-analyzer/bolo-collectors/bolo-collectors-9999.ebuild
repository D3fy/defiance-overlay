# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3 eutils

DESCRIPTION="Collector Scripts for bolo"
HOMEPAGE="https://github.com/bolo/bolo-collectors"

EGIT_REPO_URI="https://github.com/bolo/bolo-collectors"
LICENSE="GPL-3"
SLOT="0"
IUSE="+http +iptables mysql postgres rrdtool"

DEPEND="
	>=dev-libs/libvigor-1.1.0
	http?     ( net-misc/curl )
	iptables? ( net-firewall/iptables[ipv6] )
	mysql?    ( virtual/mysql )
	postgres? ( dev-db/postgresql:* )
	rrdtool?  ( net-analyzer/rrdtool )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_with http httpd-collector) \
		$(use_with iptables fw-collector) \
		$(use_with mysql mysql-collector) \
		$(use_with postgres postgres-collector) \
		$(use_with rrdtool rrdcache-collector)
}
